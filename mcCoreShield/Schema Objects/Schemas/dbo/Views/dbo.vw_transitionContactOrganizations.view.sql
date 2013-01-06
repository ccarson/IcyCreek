CREATE VIEW [dbo].[vw_transitionContactOrganizations] AS 
	SELECT id
		, transitionSystemsID
		, legacyID AS ContactOrganizationsID
	FROM dbo.transitionIdentities AS ti
	WHERE EXISTS (
		SELECT * 
		FROM dbo.coreConvertedTables 
		WHERE id = ti.convertedTableID AND 
			tableName = 'mc_contact_organizations' )
