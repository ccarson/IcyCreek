CREATE VIEW [dbo].[vw_transitionOrgDepartments] AS 
	SELECT id
		, transitionSystemsID
		, legacyID AS OrgDepartmentsID
	FROM dbo.transitionIdentities AS ti
	WHERE EXISTS (
		SELECT * 
		FROM dbo.coreConvertedTables 
		WHERE id = ti.convertedTableID AND 
			tableName = 'mc_org_departments' )
