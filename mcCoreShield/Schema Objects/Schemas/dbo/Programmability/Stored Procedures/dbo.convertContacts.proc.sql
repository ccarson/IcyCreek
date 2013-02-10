CREATE PROCEDURE [dbo].[convertContacts] (
	@systemID AS INT, @systemName AS NVARCHAR(50)
	, @dbname AS NVARCHAR(50), @tableName AS NVARCHAR(50) )
AS
BEGIN
	SET NOCOUNT ON ;

	DECLARE @sql AS NVARCHAR(4000) ;

/* load legacy data into Contacts */
	INSERT INTO dbo.Contacts (
		id, Salutation, JobTitle
		, Firstname, Initial, Lastname
		, Suffix, Email, Login
		, Password, salt, AccessID
		, Expires, Hits, LastLogin
		, Status, ModifiedBy, DateModified
		, datejoined, membertype, photo
		, resume, thumb, PIN
		, reset, mailsent, sysmember
		, maildate, updatesent, updatenum
		, nosend, hidden, security_level
		, review, Q1, Q2
		, Q3, iAnswer, ipMac
		, frequency_id, refer, is_active
		, TimeZone, usesDaylight, TzOffset
		, iDefault_Quota, iDoc_Usage, assist_id
		, layout, bTOS, bOnlineNow
		, uID, iwkgrplayout, sAboutMe
		, folder_id, signature, dateAdded
		, addedBy, bAuditLock, bProfileUpdate
		, bexpirereminder, bPingSent, dPingDate
		, bVerified, verifiedBy, dVerifiedDate, inetwork )
	SELECT 
		t.id, c.Salutation, c.JobTitle
		, c.Firstname, c.Initial, c.Lastname
		, c.Suffix, c.Email, c.Login
		, c.Password, c.salt, c.AccessID
		, c.Expires, c.Hits, c.LastLogin
		, c.Status, c.ModifiedBy, c.DateModified
		, c.datejoined, c.membertype, c.photo
		, c.resume, c.thumb, c.PIN
		, c.Reset, c.mailsent, c.sysmember
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
		, t2.id, c.bAuditLock, c.bProfileUpdate
		, c.bexpirereminder, c.bPingSent, c.dPingDate
		, c.bVerified, t3.id, c.dVerifiedDate, c.inetwork 
	FROM dbo.mc_contactSYN AS c
	INNER JOIN dbo.tempLegacyIDs AS t ON t.legacyID = c.id
	LEFT OUTER JOIN dbo.tempLegacyIDs AS t2 ON t2.legacyID = c.addedBy
	LEFT OUTER JOIN dbo.tempLegacyIDs AS t3 ON t3.legacyID = c.iVerifiedBy ;

	INSERT INTO dbo.transitionIdentities
	SELECT * FROM dbo.tempLegacyIDs ;

	/* drop legacy table from target database */
	SET @sql = N'DROP TABLE ' + @dbname + N'.dbo.mc_contact' ;
	EXECUTE sp_executesql @sql ;

	/* create view on target database to replace legacy table */
	SET @sql = N'
		USE ' + QUOTENAME(@dbname, '[]') + N';
		EXEC ( ''
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
												WHERE systemName = N''''' + @dbName + N''''' )				
			LEFT OUTER JOIN dbo.vw_transitionContacts AS t2 ON t2.id = c.addedBy
				AND t2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' )				
			LEFT OUTER JOIN dbo.vw_transitionContacts AS t3 ON t3.id = c.verifiedBy 
				AND t3.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) '' ) ';

	EXECUTE sp_executesql @sql ;

END
