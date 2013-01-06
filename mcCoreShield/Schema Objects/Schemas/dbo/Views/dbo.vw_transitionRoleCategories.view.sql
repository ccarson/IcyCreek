CREATE VIEW [dbo].[vw_transitionRoleCategories] AS 
	SELECT id
		, transitionSystemsID
		, legacyID AS RoleCategoriesID
	FROM dbo.transitionIdentities AS ti
	WHERE EXISTS (
		SELECT * 
		FROM dbo.coreConvertedTables 
		WHERE id = ti.convertedTableID AND 
			tableName = 'mc_roles_category' )
