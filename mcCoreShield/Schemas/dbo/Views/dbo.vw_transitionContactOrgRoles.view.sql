CREATE VIEW [dbo].[vw_transitionContactOrgRoles] AS 
	SELECT id
		, transitionSystemsID
		, legacyID AS ContactOrgRolesID
	FROM dbo.transitionIdentities AS ti
	WHERE EXISTS (
		SELECT * 
		FROM dbo.coreConvertedTables 
		WHERE id = ti.convertedTableID AND 
			tableName = 'mc_contact_orgroles' )
