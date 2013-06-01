
CREATE PROCEDURE [dbo].[spGroupMemberFileace] ( 
	@operation AS nvarchar(50) ) AS
BEGIN

	SET NOCOUNT ON ;

	IF @operation = N'INSERT'
	BEGIN
		INSERT INTO dbo.vfc_fileace (
			FileID, UserGroupID, UserGroupTypeID
				, bAdmin, privateFile, igrouproleid
				, icustomprofileid, iminigroupid, iuserid )
		SELECT f.id, g.group_id, g.type_id
				, 0, 0, 2
				, 0, 0, mg.ForeignKeyID
		FROM #mc_groupmembers_temp AS mg
		INNER JOIN dbo.mc_groups AS g ON g.Group_ID = mg.GroupID
		INNER JOIN dbo.vfc_folder AS fld ON fld.group_id = g.Group_ID
		INNER JOIN dbo.vfc_file AS f ON f.ParentFolderID = fld.ID 
		WHERE NOT EXISTS ( 
			SELECT * FROM dbo.vfc_fileace AS ace 
			WHERE ace.FileID = f.id AND ace.privateFile = 1 ) ; 
	END 

	IF @operation = N'DELETE'
	BEGIN
		DELETE dbo.vfc_fileace
		FROM dbo.vfc_fileace AS ace
		INNER JOIN dbo.vfc_file AS f ON f.id = ace.FileID
		INNER JOIN dbo.vfc_folder AS fld ON fld.id = f.ParentFolderID
		INNER JOIN dbo.mc_groups AS g ON g.Group_ID = fld.group_id
		INNER JOIN #mc_groupmembers_temp AS mg
			ON mg.GroupID = g.Group_ID AND mg.ForeignKeyID = ace.iuserid ;
	END
	
END
