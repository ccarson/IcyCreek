CREATE PROCEDURE [dbo].[convertContactOrganizations] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50) 
	, @dbname AS NVARCHAR(50) 
	, @tableName AS NVARCHAR (50) )	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql AS NVARCHAR(4000);

	INSERT INTO dbo.ContactOrganizations (
		id, contactsID, organizationsID
		, orgDepartmentsID, orgLocationsID
		, isDefault, isChosen, isEmergencyContact
		, dateAdded, dateUpdated )
	SELECT t.id, c.id, o.id
		, d.id, l.id 
		, defaultorg, chosenorg, emergency_contact
		, date_added, date_updated
	FROM dbo.mc_contact_organizationsSYN AS co
	INNER JOIN dbo.tempLegacyIDs AS t ON co.id = t.legacyID
	INNER JOIN dbo.vw_transitionContacts AS c ON co.user_id = c.contactsID 
		AND c.transitionSystemsID = @systemID
	INNER JOIN dbo.vw_transitionOrganizations AS o ON co.org_id = o.organizationsID 
		AND o.transitionSystemsID = @systemID
	INNER JOIN dbo.vw_transitionOrgLocations AS l ON co.location_id = l.orgLocationsID 
		AND l.transitionSystemsID = @systemID
	LEFT OUTER JOIN dbo.vw_transitionOrgDepartments d ON co.org_dept_id = d.orgDepartmentsID 
		AND d.transitionSystemsID = @systemID
	ORDER BY co.user_id;
	
	INSERT INTO dbo.transitionIdentities
	SELECT * FROM dbo.tempLegacyIDs;
	
	
	SET @sql = N'DROP TABLE ' + @dbname + '.dbo.mc_contact_organizations' ;
	EXECUTE sp_executesql @sql;

	SET @sql = N'
		USE [' + @dbname + '] ; 
		EXEC ( ''
			CREATE VIEW dbo.mc_contact_organizations AS
			SELECT t.ContactOrganizationsID AS id, c.ContactsID AS user_id
				, o.OrganizationsID AS org_id, COALESCE( d.OrgDepartmentsID, 0 ) AS org_dept_id
				, isDefault AS defaultorg, isChosen AS chosenorg 
				, l.OrgLocationsID AS location_id
				, isEmergencyContact AS emergency_contact
				, dateAdded AS date_added, dateUpdated AS date_updated
			FROM dbo.ContactOrganizations AS co
			INNER JOIN dbo.vw_transitionContactOrganizations AS t ON co.id = t.id 
				AND t.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' )
			INNER JOIN dbo.vw_transitionContacts AS c ON co.contactsID = c.id 
				AND c.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			INNER JOIN dbo.vw_transitionOrganizations AS o ON co.organizationsID = o.id 
				AND o.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' )
			INNER JOIN dbo.vw_transitionOrgLocations AS l ON co.OrgLocationsID = l.id 
				AND l.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' )
			LEFT OUTER JOIN dbo.vw_transitionOrgDepartments AS d ON co.OrgDepartmentsID = d.id 
				AND d.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) '' ) '; 

				
	EXECUTE sp_executesql @sql;

END
