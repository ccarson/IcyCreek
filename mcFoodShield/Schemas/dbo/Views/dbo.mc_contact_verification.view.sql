CREATE VIEW dbo.mc_contact_verification AS SELECT tv.ContactVerificationsID AS id, tc1.contactsID AS user_id
				, COALESCE( tc2.contactsID, 0 ) AS verified_by
				, v.verified_date
			FROM dbo.ContactVerifications AS v
			INNER JOIN dbo.vw_transitionContactVerifications AS tv ON tv.id = v.id 
				AND tv.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	 
			INNER JOIN dbo.vw_transitionContacts AS tc1 ON tc1.id = v.contactsID
				AND tc1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	 
			LEFT JOIN dbo.vw_transitionContacts AS tc2 ON tc2.id = v.verified_by
				AND	tc2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )