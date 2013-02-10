CREATE VIEW dbo.mc_org_location AS SELECT t.orgLocationsID AS id, addressTypeID, name, address1
				, address2, address3, city
				, state, zip, d_phone
				, d_fax, o.organizationsID AS org_id, active
				, notes, country, d_emergency_phone
				, d_24hr_phone, date_added, date_updated, d_infectious_phone, isAlternate as bAlternate 
			FROM dbo.OrgLocations AS l
			INNER JOIN dbo.vw_transitionOrgLocations AS t ON t.id = l.id 
				AND t.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	 
			INNER JOIN dbo.vw_transitionOrganizations AS o ON o.id = l.organizationsID 
				AND o.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	 ;