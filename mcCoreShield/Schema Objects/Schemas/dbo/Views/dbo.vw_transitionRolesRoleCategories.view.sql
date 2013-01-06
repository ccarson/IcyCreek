CREATE VIEW [dbo].[vw_transitionRolesRoleCategories] AS 
	SELECT id
		, transitionSystemsID
		, legacyID AS RolesRoleCategoriesID
	FROM dbo.transitionIdentities AS ti
	WHERE EXISTS (
		SELECT * 
		FROM dbo.coreConvertedTables 
		WHERE id = ti.convertedTableID AND 
			tableName = 'mc_roles_relation' )
