CREATE PROCEDURE [dbo].[findFiles] (
	@userID			AS INT
	, @searchTerms	AS NVARCHAR(max)
	, @sortField	AS NVARCHAR(40) = NULL
	, @sortOrder	AS NVARCHAR(5)  = NULL )
AS 
/*

	  Name:		findFiles
	Author:		Datastream Connexion
				ccarson
	  Date:		2012-02-01
   Purpose:		Given a userID and set of keywords, return files
				for that user that match the criteria

	 Logic:		Parse incoming search terms
					( should be comma-separated list )
				Find files on vfc_file that match search terms
				Find files on vfc_file_keywords that match search terms
				Return relevant file data for selected files
				Sort output by specified criteria
				
*/	
BEGIN
	SET NOCOUNT ON;

	DECLARE @sql			AS NVARCHAR(1000) ;
	DECLARE @delimiter		AS NCHAR(1) = N','; 
	DECLARE @likeOperator	AS NCHAR(1) = N'%' ;

	DECLARE @keywordsTable AS TABLE ( searchTerm NVARCHAR(300) ) ;

	DECLARE @vfcFiles		AS TABLE ( fileID uniqueidentifier PRIMARY KEY CLUSTERED ) ;

	DECLARE @keywordFiles	AS TABLE ( fileID uniqueidentifier PRIMARY KEY CLUSTERED ) ; 

	
--	remove trailing delimiter from @searchTerms if it exists
	IF RIGHT(@searchTerms, 1) = @delimiter
		SELECT @searchTerms = LEFT(@searchTerms, len(@searchTerms) - 1) ;

--	parse @searchTerms and load results into @keywordsTable
	INSERT INTO  @keywordsTable
		 SELECT  Item
	       FROM  dbo.udfListFromDelimitedString( @searchTerms, @delimiter ) ;

--	update searchTerms, prepending and appending % so we can use LIKE operator	       
	UPDATE  @keywordsTable
	   SET  searchTerm = searchTerm + @likeOperator ; 

	INSERT	@vfcFiles
	SELECT  DISTINCT uid FROM dbo.vfc_File
	 WHERE  EXISTS ( SELECT 1 FROM @keywordsTable k WHERE sComments LIKE k.searchTerm ) 
	    OR  EXISTS ( SELECT 1 FROM @keywordsTable k WHERE sName LIKE k.searchTerm ) 	    
		OR  EXISTS ( SELECT 1 FROM @keywordsTable k WHERE sSubject LIKE k.searchTerm ) ; 

	INSERT  @vfcFiles
	SELECT  DISTINCT fileID 
	  FROM  dbo.vfc_file_keywords
	 WHERE  EXISTS ( SELECT 1 FROM @keywordsTable k WHERE keyword LIKE k.searchTerm )
	   AND  fileID NOT IN ( SELECT fileID FROM @vfcFiles ) ; 



--	query vfc_file for records matching search terms
	SELECT DISTINCT 
		  f.ID, f.MIMETypeID, f.ParentFolderID AS folderID
		, f.iByteSize, f.sName, f.serverFileName, f.sAuthor
		, f.sSource, f.iRevision, f.sTitle, f.sSubject
		, f.sLocation, f.bDeleted, f.dtCreated, f.CreatedByUserID
		, f.dtUpdated, f.UpdatedByUserID, f.dtCheckedOut
		, f.CheckedOutByUserID, f.sComments, f.sDescription
		, f.sContentType, f.bActive, f.Status, f.threadID
		, f.pLocation, f.sCheckOutComments, f.bLog, f.iSendLog
		, f.iViews, f.bShare, f.bUseAuthor, f.showGroup
		, f.sharegroup, f.iDownloads, f.dtExpires, f.isortOrder
		, f.iMinorRevision, f.allowComments, f.thumbs
		, f.thumblocation, f.iComments, f.iPriority, f.bPublic
		, f.placeholder, f.bsecureview, f.bencrypted
		, fld.ParentFolderID, fld.sName AS folderName
		, fld.sLocation AS folderLocation, fld.sDescription AS folderDesc
		, fld.dtUpdated AS fld_dtUpdated, fld.updatedByUserID AS fld_updatedByUserID
		, mc.firstname, mc.lastname, ace.igrouproleid, mt.sFileExtension
		, fos.UserGroupID, 0 AS privatefile
	INTO  #fileData
	FROM  dbo.vfc_file			 AS f 
   INNER  JOIN @vfcFiles		 AS vf  ON vf.fileID = f.uid 
	LEFT  JOIN dbo.vfc_folder    AS fld	ON fld.id = f.ParentFolderID
	LEFT  JOIN dbo.vfc_fileace   AS ace	ON ace.FileID = f.id
   INNER  JOIN dbo.mc_contact    AS mc	ON mc.ID = f.createdbyuserid
	LEFT  JOIN dbo.vfc_mimetype  AS mt	ON f.mimetypeID = mt.id
	LEFT  JOIN dbo.vfc_folderace AS fos	ON f.ParentFolderID = fos.FolderID
   WHERE  ace.iuserid = @userID 
     AND  f.bActive = 1 
     AND  f.bDeleted = 0 ; 


	SELECT	@sortOrder = CASE @sortField
							WHEN 'f.sName'		  THEN 'ORDER BY sName'
							WHEN 'f.dtCreated'	  THEN 'ORDER BY dtCreated'
							WHEN 'm.sFileExtension' THEN 'ORDER BY sFileExtension'
							ELSE NULL
						 END ;

	IF  @sortOrder IS NOT NULL AND @sortOrder = 'DESC'
		SELECT @sortOrder = @sortOrder + ' DESC' ;

	SELECT @sql = 'SELECT * FROM #fileData ' + ISNULL(@sortOrder, '') + '; ' ; 

	EXEC (@sql) ;
	
END
