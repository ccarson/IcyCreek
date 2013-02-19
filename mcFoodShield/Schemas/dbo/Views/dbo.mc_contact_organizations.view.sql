
CREATE VIEW [dbo].[mc_contact_organizations] AS SELECT t.ContactOrganizationsID AS id, c.ContactsID AS user_id
				, o.OrganizationsID AS org_id, COALESCE( d.OrgDepartmentsID, 0 ) AS org_dept_id
				, isDefault AS defaultorg, isChosen AS chosenorg 
				, COALESCE( l.OrgLocationsID, 0 ) AS location_id
				, isEmergencyContact AS emergency_contact
				, dateAdded AS date_added, dateUpdated AS date_updated
			FROM dbo.ContactOrganizations AS co
			INNER JOIN dbo.vw_transitionContactOrganizations AS t ON co.id = t.id 
				AND t.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	
			INNER JOIN dbo.vw_transitionContacts AS c ON co.contactsID = c.id 
				AND c.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	
			INNER JOIN dbo.vw_transitionOrganizations AS o ON co.organizationsID = o.id 
				AND o.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	
			LEFT JOIN dbo.vw_transitionOrgLocations AS l ON co.OrgLocationsID = l.id 
				AND l.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	
			LEFT OUTER JOIN dbo.vw_transitionOrgDepartments AS d ON co.OrgDepartmentsID = d.id 
				AND d.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )