CREATE VIEW [dbo].[vw_transitionRoles] AS 
	SELECT id
		, transitionSystemsID
		, legacyID AS RolesID
	FROM dbo.transitionIdentities AS ti
	WHERE EXISTS (
		SELECT * 
		FROM dbo.coreConvertedTables 
		WHERE id = ti.convertedTableID AND 
			tableName = 'mc_roles' )
