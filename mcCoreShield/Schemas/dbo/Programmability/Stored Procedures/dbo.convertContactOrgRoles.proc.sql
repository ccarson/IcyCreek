﻿CREATE PROCEDURE [dbo].[convertContactOrgRoles] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50) 
	, @dbname AS NVARCHAR(50) 
	, @tableName AS NVARCHAR (50) )	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql AS NVARCHAR(4000);

	INSERT INTO dbo.ContactOrgRoles (
		id, contactsID, organizationsID
		, orgDepartmentsID, rolesID, isHead
		, dateAdded, addedBy, dateUpdated, updatedBy )
	SELECT t.id, tc1.id, o.id
		, d.id, r.id, is_Head
		, date_added, tc2.id, date_modified, tc3.id
	FROM dbo.mc_contact_orgrolesSYN AS cor
	INNER JOIN dbo.tempLegacyIDs AS t ON t.legacyID = cor.id
	INNER JOIN dbo.vw_transitionContacts AS tc1 ON tc1.contactsID = cor.user_id
		AND tc1.transitionSystemsID = @systemID
	INNER JOIN dbo.vw_transitionOrganizations AS o ON o.organizationsID = cor.org_id  
		AND o.transitionSystemsID = @systemID
	INNER JOIN dbo.vw_transitionRoles AS r ON r.RolesID = cor.role_id  
		AND r.transitionSystemsID = @systemID
	LEFT OUTER JOIN dbo.vw_transitionOrgDepartments d ON d.orgDepartmentsID = cor.dept_id
		AND d.transitionSystemsID = @systemID
	LEFT OUTER JOIN dbo.vw_transitionContacts AS tc2 ON tc2.contactsID = cor.added_by
		AND tc2.transitionSystemsID = @systemID
	LEFT OUTER JOIN dbo.vw_transitionContacts AS tc3 ON tc3.contactsID = cor.modified_by
		AND tc3.transitionSystemsID = @systemID
	ORDER BY cor.user_id;
	
	INSERT INTO dbo.transitionIdentities
	SELECT * FROM dbo.tempLegacyIDs;
	
	SET @sql = N'DROP TABLE ' + @dbname + '.dbo.mc_contact_orgroles' ;
	EXECUTE sp_executesql @sql;

	SET @sql = N'
		USE [' + @dbname + '] ; 
		EXEC ( ''
		CREATE VIEW dbo.mc_contact_orgroles AS
			SELECT t.ContactOrgRolesID AS id, tc1.ContactsID AS user_id
				, o.OrganizationsID AS org_id, COALESCE( d.OrgDepartmentsID, 0 ) AS dept_id
				, r.RolesID as role_id, isHead as is_head
				, dateAdded as date_added, COALESCE( tc2.ContactsID, 0 ) as added_by
				, dateUpdated as date_modified, COALESCE( tc3.ContactsID, 0 ) as modified_by
			FROM dbo.ContactOrgRoles AS cor
			INNER JOIN dbo.vw_transitionContactOrgRoles AS t ON t.id = cor.id 
				AND t.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			INNER JOIN dbo.vw_transitionContacts AS tc1 ON tc1.id = cor.ContactsID
				AND tc1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
													WHERE systemName = N''''' + @dbName + N''''' )
			INNER JOIN dbo.vw_transitionOrganizations AS o ON o.id = cor.organizationsID 
				AND o.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			INNER JOIN dbo.vw_transitionRoles AS r ON r.id = cor.RolesID
				AND r.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			LEFT OUTER JOIN dbo.vw_transitionContacts AS tc2 ON tc2.id = cor.addedBy
				AND tc2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' )
			LEFT OUTER JOIN dbo.vw_transitionContacts AS tc3 ON tc3.id = cor.updatedBy
				AND tc3.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' )
			LEFT OUTER JOIN dbo.vw_transitionOrgDepartments AS d ON cor.OrgDepartmentsID = d.id 
				AND d.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) '' ) '; 
				
	EXECUTE sp_executesql @sql;

END