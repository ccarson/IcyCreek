CREATE VIEW dbo.mc_contact AS SELECT 
	t1.contactsID AS id, c.Salutation, c.JobTitle
	, c.Firstname, c.Initial, c.Lastname
	, c.Suffix, c.Email, c.Login
	, c.Password, c.salt, c.AccessID
	, c.Expires, c.Hits, c.LastLogin
	, c.Status, c.ModifiedBy, c.DateModified
	, c.datejoined, c.membertype, c.photo
	, c.resume, c.thumb, c.PIN
	, c.reset, c.mailsent, c.sysmember
	, c.maildate, c.updatesent, c.updatenum
	, c.nosend, c.hidden, c.security_level
	, c.review, c.Q1, c.Q2
	, c.Q3, c.iAnswer, c.ipMac
	, c.frequency_id, c.refer, c.is_active
	, c.TimeZone, c.usesDaylight, c.TzOffset
	, c.iDefault_Quota, c.iDoc_Usage, c.assist_id
	, c.layout, c.bTOS, c.bOnlineNow
	, c.uID, c.iwkgrplayout, c.sAboutMe
	, c.folder_id, c.signature, c.dateAdded
	, COALESCE( t2.contactsID, 0 ) AS addedBy, c.bAuditLock, c.bProfileUpdate
	, c.bexpirereminder, c.bPingSent, c.dPingDate
	, c.bVerified, COALESCE( t3.contactsID, 0 ) AS iVerifiedBy, c.dVerifiedDate, c.inetwork
	FROM dbo.Contacts AS c
	INNER JOIN dbo.vw_transitionContacts AS t1 ON t1.id = c.id
		AND t1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
										WHERE systemName = db_name() )				
	LEFT OUTER JOIN dbo.vw_transitionContacts AS t2 ON t2.id = c.addedBy
		AND t2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
										WHERE systemName = db_name() )				
	LEFT OUTER JOIN dbo.vw_transitionContacts AS t3 ON t3.id = c.verifiedBy 
		AND t3.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
										WHERE systemName = db_name() ) ;