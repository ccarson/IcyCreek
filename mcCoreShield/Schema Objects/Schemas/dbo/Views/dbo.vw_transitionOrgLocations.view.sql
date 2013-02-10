
CREATE VIEW dbo.vw_transitionOrgLocations AS 
	SELECT id
		, transitionSystemsID
		, legacyID AS OrgLocationsID
	FROM dbo.transitionIdentities AS ti
	WHERE EXISTS (
		SELECT * 
		FROM dbo.coreConvertedTables 
		WHERE id = ti.convertedTableID AND 
			tableName = 'mc_org_location' ) 