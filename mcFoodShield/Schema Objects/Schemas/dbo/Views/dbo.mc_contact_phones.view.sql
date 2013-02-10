CREATE VIEW dbo.mc_contact_phones AS SELECT tp.ContactPhonesID AS id, p.phone, tc.contactsID AS user_id
				, p.type_id, p.edefault, p.active
				, p.epublic, p.extension, p.alert, p.is_emergency
			FROM dbo.ContactPhones AS p
			INNER JOIN dbo.vw_transitionContactPhones AS tp	ON tp.id = p.id
				AND	tp.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	
			INNER JOIN dbo.vw_transitionContacts AS tc ON tc.id = p.ContactsID
				AND	tc.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )