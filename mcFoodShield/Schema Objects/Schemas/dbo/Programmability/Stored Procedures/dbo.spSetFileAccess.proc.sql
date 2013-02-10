
CREATE PROCEDURE [dbo].[spSetFileAccess] ( 
	  @access AS nvarchar(50) 
	, @folderID AS NVARCHAR(100) = N''
	, @fileID AS NVARCHAR(100) = N''
	, @groupID AS NVARCHAR(100)
	, @userID AS NVARCHAR(100) = N'' ) 
AS
BEGIN

/* 
*****************************************************************************************

    spSetFileAccess
    grants/revokes file access based on folder, file, group and user
	
	Builds list for file access based on descending hierarchy
	
	Inputs:  @access   -- either "GRANT" or "REVOKE" the action that will be performed
	
			 @folderID -- one or more folderIDs that can be passed in.  These are the folders
							to which access will be granted or revoked.
						  Use this parameter to grant/revoke access to all files in a folder
							or set of folders.

			 @fileID   -- one or more fileIDs that can be passed in.  These are the files 
							to which access will be granted or revoked.
						  Use this parameter to grant/revoke access to a set of files.
						  NOTE:  If this parameter is used, @folderID is ignored!!
							
			 @groupID  -- one or more workgroups to which access will be granted or revoked
						  Use this parameter to specify one or more workgroups that will have 
							access granted/revoked
			 
			 @userID   -- one or more users to which access will be granted or revoked
						  This parameter is limited by the groupID.  If a user belongs to 
			
	ERROR CODES
	100		no valid groupIDs specified
    
	Description:

    Change History
    Date        Author        Comments
    ----        ------        --------
    2012-03-03  ccarson       initial creation
*****************************************************************************************
*/

	SET NOCOUNT ON ;

	DECLARE @files		AS TABLE ( fileID		INT ) ;
	DECLARE @groups		AS TABLE ( groupID		INT 
								 , type_id		INT ) ;
	DECLARE @users 		AS TABLE ( groupID		INT
								 , userID		INT ) ;
	
/*	parse inputs into individual tables		*/
	
		  
	INSERT INTO  @groups ( groupID, type_id )
		 SELECT  Group_ID, Type_ID 
		   FROM  dbo.mc_groups AS g
		  WHERE  g.Group_ID IN ( 
				 SELECT  Item 
				   FROM  mcCoreShield.dbo.udfListFromDelimitedString( @groupID, N',' ) ) ;

	IF  @@ROWCOUNT = 0 
		RAISERROR ( 'No valid groups were specified', 16, 101 ) ;
						   
	INSERT INTO  @files ( fileID )
		 SELECT  f.ID
		   FROM  mcCoreShield.dbo.udfListFromDelimitedString( @folderID, N',' ) AS l
	 INNER JOIN  dbo.vfc_file AS f ON f.ParentFolderID = l.item
	      WHERE  @fileID = ''
	  UNION ALL
		 SELECT  l.Item
		   FROM  mcCoreShield.dbo.udfListFromDelimitedString( @fileID, N',' ) AS l
	      WHERE  @fileID > N'' ;

	INSERT INTO  @users ( 
				 groupID, userID )
		 SELECT  gm.GroupID, gm.ForeignKeyID
		   FROM  dbo.mc_groupmembers AS gm
	 INNER JOIN  @groups AS g ON g.groupID = gm.GroupID
	      WHERE  @userID = N''
	  UNION ALL 
		 SELECT  gm.GroupID, gm.ForeignKeyID
		   FROM  dbo.mc_groupmembers AS gm
	 INNER JOIN  @groups AS g ON g.groupID = gm.GroupID
	      WHERE  gm.ForeignKeyID IN ( 
				 SELECT  Item
				   FROM  mcCoreShield.dbo.udfListFromDelimitedString( @userID, N',' ) ) ;
	  
	IF  @access = 'GRANT'
		INSERT INTO  dbo.vfc_fileace (
					 FileID, UserGroupID, UserGroupTypeID
						, bAdmin, privateFile, igrouproleid
						, icustomprofileid, iminigroupid, iuserid )
		     SELECT  f.fileID, g.groupID, g.type_id
						, 0, 0, 2
						, 0, 0, u.userID
			   FROM  @groups AS g
		 INNER JOIN  @users  AS u ON g.groupID = u.groupID
		 CROSS JOIN  @files  AS f
		      WHERE  NOT EXISTS ( SELECT  1 
								    FROM  dbo.vfc_fileace AS ace
								   WHERE  ( f.fileID  = ace.FileID AND
											g.groupID = ace.UserGroupID AND
											u.userID  = ace.iuserID ) 
									  OR  ( f.FileID  = ace.FileID AND
											ace.privateFile = 1 ) ) ;

	IF  @access = 'REVOKE'
		WITH  deletions 
		  AS  ( SELECT  * 
				  FROM  dbo.vfc_fileace AS ace
				 WHERE  EXISTS ( SELECT 1 
								   FROM @users AS u 
								  WHERE u.GroupID = ace.UserGroupID
								    AND u.userID  = ace.iuserid ) 
				   AND	EXISTS ( SELECT 1 
								   FROM @files AS f
								  WHERE f.fileID = ace.FileID ) )
		DELETE deletions ;
	
END