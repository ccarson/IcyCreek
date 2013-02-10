CREATE VIEW dbo.mc_contact_notes AS SELECT tn.ContactNotesID AS id, tc1.contactsID AS user_id, n.notes
				, COALESCE( tc2.contactsID, 0 ) AS admin_id, n.dateAdded, n.type_id
			FROM dbo.ContactNotes AS n
			INNER JOIN dbo.vw_transitionContactNotes AS tn ON n.id = tn.id 
				AND tn.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	
			INNER JOIN dbo.vw_transitionContacts AS tc1 ON n.ContactsID = tc1.id 
				AND tc1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	 
			LEFT JOIN dbo.vw_transitionContacts AS tc2	ON n.adminID = tc2.id 
				AND tc2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )