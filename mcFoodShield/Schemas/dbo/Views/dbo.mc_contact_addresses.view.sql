CREATE VIEW dbo.mc_contact_addresses AS SELECT t.ContactAddressesID AS id, a.add_type, a.address1
				, a.address2, a.address3, a.city
				, a.state, a.zip, a.country
				, tc.contactsID AS user_id, a.defaultaddress, a.name, a.createdDate
			FROM dbo.ContactAddresses AS a
			INNER JOIN dbo.vw_transitionContactAddresses AS t ON a.id = t.id
				AND t.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	 
			INNER JOIN dbo.vw_transitionContacts AS tc ON a.ContactsID = tc.id
				AND tc.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )