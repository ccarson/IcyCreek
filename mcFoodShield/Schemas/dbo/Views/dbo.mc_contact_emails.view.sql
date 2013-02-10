CREATE VIEW dbo.mc_contact_emails AS SELECT te.ContactEmailsID AS id, e.email, tc.contactsID AS user_id
				, e.type_id, e.edefault, e.active
				, e.epublic, e.alert, e.is_emergency
			FROM dbo.ContactEmails AS e
			INNER JOIN dbo.vw_transitionContactEmails AS te	ON e.id = te.id
				AND te.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	 
			INNER JOIN dbo.vw_transitionContacts AS tc ON e.contactsID = tc.id
				AND tc.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )