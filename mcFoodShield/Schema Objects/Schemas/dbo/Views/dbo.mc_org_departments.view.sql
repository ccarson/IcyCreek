CREATE VIEW dbo.mc_org_departments AS SELECT td1.OrgDepartmentsID AS id, name, o.OrganizationsID AS org_id
			, l.OrgLocationsID AS location_id
			, COALESCE( td2.OrgDepartmentsID, 0 ) AS parent_dept_id
			, active, notes, website
			, date_added, COALESCE(tc1.ContactsID, 0) AS added_by
			, date_updated, COALESCE(tc2.ContactsID, 0) AS updated_by, org_level
		FROM dbo.OrgDepartments AS d
		INNER JOIN dbo.vw_transitionOrgDepartments AS td1 ON td1.id = d.id 
			AND td1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	
		INNER JOIN dbo.vw_transitionOrganizations AS o ON o.id = d.organizationsID
			AND o.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	
		INNER JOIN dbo.vw_transitionOrgLocations AS l ON l.id = d.orgLocationsID
			AND l.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	
		LEFT OUTER JOIN dbo.vw_transitionOrgDepartments AS td2 ON td2.id = d.parentDepartmentsID
			AND td2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	
		LEFT OUTER JOIN dbo.vw_transitionContacts AS tc1 ON tc1.id = d.added_by
			AND	tc1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	
		LEFT OUTER JOIN dbo.vw_transitionContacts AS tc2 ON tc2.id = d.updated_by
			AND	tc2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )