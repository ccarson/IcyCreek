﻿CREATE PROCEDURE [dbo].[convertOrgDepartments] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50) 
	, @dbname AS NVARCHAR(50) 
	, @tableName AS NVARCHAR (50) )	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql AS NVARCHAR(4000);
	
	INSERT INTO dbo.OrgDepartments ( 
		id, name, organizationsID
		, orgLocationsID, parentDepartmentsID, org_level
		, active, notes, website
		, date_added, added_by, date_updated, updated_by )
	SELECT t1.id, name, o.id
		, l.id, t2.id, org_level
		, active, notes, website
		, date_added, tc1.id, date_updated, tc2.id
	FROM dbo.mc_org_departmentsSYN AS d
	INNER JOIN dbo.tempLegacyIDs AS t1 on t1.legacyID = d.id
	INNER JOIN dbo.vw_transitionOrganizations AS o ON o.organizationsID = d.org_id
		AND o.transitionSystemsID = @systemID
	INNER JOIN dbo.vw_transitionOrgLocations AS l ON l.orgLocationsID = d.location_id 
		AND l.transitionSystemsID = @systemID
	LEFT JOIN dbo.vw_transitionContacts AS tc1 ON tc1.ContactsID = d.added_by 
		AND tc1.transitionSystemsID = @systemID
	LEFT JOIN dbo.vw_transitionContacts AS tc2 ON tc2.ContactsID = d.updated_by 
		AND tc2.transitionSystemsID = @systemID
	LEFT JOIN dbo.tempLegacyIDs AS t2 ON t2.legacyID = d.parent_dept_id;
	
	IF @dbname = 'mcfern'
	BEGIN 
		SET @sql = ' 

		INSERT INTO dbo.OrgDepartmentLab ( 
			id, fernActive, micro, chem, rad, isSearchable
			, microAcceptedOn, microWithdrawOn
			, chemAcceptedOn, chemWithdrawOn
			, radAcceptedOn, radWithdrawOn )
		SELECT t1.id, fern_Active, micro, chem, rad, is_searchable
			, micro_date_accept, micro_date_withdraw
			, chem_date_accept, chem_date_withdraw
			, rad_date_accept, rad_date_withdraw 
		FROM dbo.mc_org_departmentsSYN AS d
		INNER JOIN dbo.tempLegacyIDs AS t1 on t1.legacyID = d.id 
		INNER JOIN dbo.OrgDepartments AS od on t1.id = od.id ; '
		EXECUTE sp_executeSQL @sql ; 
	END
	
	IF @dbname = 'mcNAHLN'
	BEGIN 
		SET @sql = ' 
		INSERT INTO dbo.OrgDepartmentLab ( 
			id, fernActive, isSearchable )
		SELECT t1.id, fern_Active, is_searchable
		FROM dbo.mc_org_departmentsSYN AS d
		INNER JOIN dbo.tempLegacyIDs AS t1 on t1.legacyID = d.id 
		INNER JOIN dbo.OrgDepartments AS od on t1.id = od.id ; '
		EXECUTE sp_executeSQL @sql ; 
	END
	

	INSERT INTO dbo.transitionIdentities
	SELECT * FROM dbo.tempLegacyIDs;

	SET @sql = N'DROP TABLE ' + @dbname + '.dbo.mc_org_departments';
	EXECUTE sp_executesql @sql;

	SET @sql = N'
	USE [' + @dbname + '] ; 
	EXEC ( ''
	CREATE VIEW dbo.mc_org_departments AS
		SELECT td1.OrgDepartmentsID AS id, name, o.OrganizationsID AS org_id
			, l.OrgLocationsID AS location_id
			, COALESCE( td2.OrgDepartmentsID, 0 ) AS parent_dept_id
			, active, notes, website
			, date_added, COALESCE(tc1.ContactsID, 0) AS added_by
			, date_updated, COALESCE(tc2.ContactsID, 0) AS updated_by, org_level
		FROM dbo.OrgDepartments AS d
		INNER JOIN dbo.vw_transitionOrgDepartments AS td1 ON td1.id = d.id 
			AND td1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' )
		INNER JOIN dbo.vw_transitionOrganizations AS o ON o.id = d.organizationsID
			AND o.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' )
		INNER JOIN dbo.vw_transitionOrgLocations AS l ON l.id = d.orgLocationsID
			AND l.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' )
		LEFT OUTER JOIN dbo.vw_transitionOrgDepartments AS td2 ON td2.id = d.parentDepartmentsID
			AND td2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' )
		LEFT OUTER JOIN dbo.vw_transitionContacts AS tc1 ON tc1.id = d.added_by
			AND	tc1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' )
		LEFT OUTER JOIN dbo.vw_transitionContacts AS tc2 ON tc2.id = d.updated_by
			AND	tc2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) '' ) ';
												
    IF @dbname = 'mcfern'
		SET @sql = N'
		USE [' + @dbname + '] ; 
		EXEC ( ''
		CREATE VIEW dbo.mc_org_departments AS
			SELECT td1.OrgDepartmentsID AS id, name, o.OrganizationsID AS org_id
				, l.OrgLocationsID AS location_id
				, COALESCE( td2.OrgDepartmentsID, 0 ) AS parent_dept_id
				, active, notes, website
				, date_added, COALESCE(tc1.ContactsID, 0) AS added_by
				, date_updated, COALESCE(tc2.ContactsID, 0) AS updated_by, org_level
				, fernActive AS fern_Active, micro, chem, rad, isSearchable AS is_searchable
				, microAcceptedOn AS micro_date_accept, microWithdrawOn AS micro_date_withdraw
				, chemAcceptedOn AS chem_date_accept, chemWithdrawOn AS chem_date_withdraw
				, radAcceptedOn AS rad_date_accept, radWithdrawOn AS rad_date_withdraw
			FROM dbo.OrgDepartments AS d 
			INNER JOIN dbo.OrgDepartmentLab AS dl ON d.id = dl.id
			INNER JOIN dbo.vw_transitionOrgDepartments AS td1 ON td1.id = d.id 
				AND td1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
													WHERE systemName = N''''' + @dbName + N''''' )
			INNER JOIN dbo.vw_transitionOrganizations AS o ON o.id = d.organizationsID
				AND o.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
													WHERE systemName = N''''' + @dbName + N''''' )
			INNER JOIN dbo.vw_transitionOrgLocations AS l ON l.id = d.orgLocationsID
				AND l.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
													WHERE systemName = N''''' + @dbName + N''''' )
			LEFT OUTER JOIN dbo.vw_transitionOrgDepartments AS td2 ON td2.id = d.parentDepartmentsID
				AND td2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
													WHERE systemName = N''''' + @dbName + N''''' )
			LEFT OUTER JOIN dbo.vw_transitionContacts AS tc1 ON tc1.id = d.added_by
				AND	tc1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
													WHERE systemName = N''''' + @dbName + N''''' )
			LEFT OUTER JOIN dbo.vw_transitionContacts AS tc2 ON tc2.id = d.updated_by
				AND	tc2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
													WHERE systemName = N''''' + @dbName + N''''' ) '' ) ';		
													
    IF @dbname = 'mcNAHLN'
		SET @sql = N'
		USE [' + @dbname + '] ; 
		EXEC ( ''
		CREATE VIEW dbo.mc_org_departments AS
			SELECT td1.OrgDepartmentsID AS id, name, o.OrganizationsID AS org_id
				, l.OrgLocationsID AS location_id
				, COALESCE( td2.OrgDepartmentsID, 0 ) AS parent_dept_id
				, active, notes, website
				, date_added, COALESCE(tc1.ContactsID, 0) AS added_by
				, date_updated, COALESCE(tc2.ContactsID, 0) AS updated_by, org_level
				, fernActive AS fern_Active, isSearchable AS is_searchable
			FROM dbo.OrgDepartments AS d 
			INNER JOIN dbo.OrgDepartmentLab AS dl ON d.id = dl.id
			INNER JOIN dbo.vw_transitionOrgDepartments AS td1 ON td1.id = d.id 
				AND td1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
													WHERE systemName = N''''' + @dbName + N''''' )
			INNER JOIN dbo.vw_transitionOrganizations AS o ON o.id = d.organizationsID
				AND o.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
													WHERE systemName = N''''' + @dbName + N''''' )
			INNER JOIN dbo.vw_transitionOrgLocations AS l ON l.id = d.orgLocationsID
				AND l.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
													WHERE systemName = N''''' + @dbName + N''''' )
			LEFT OUTER JOIN dbo.vw_transitionOrgDepartments AS td2 ON td2.id = d.parentDepartmentsID
				AND td2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
													WHERE systemName = N''''' + @dbName + N''''' )
			LEFT OUTER JOIN dbo.vw_transitionContacts AS tc1 ON tc1.id = d.added_by
				AND	tc1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
													WHERE systemName = N''''' + @dbName + N''''' )
			LEFT OUTER JOIN dbo.vw_transitionContacts AS tc2 ON tc2.id = d.updated_by
				AND	tc2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
													WHERE systemName = N''''' + @dbName + N''''' ) '' ) ';																						
				
	EXECUTE sp_executesql @sql;
	
END