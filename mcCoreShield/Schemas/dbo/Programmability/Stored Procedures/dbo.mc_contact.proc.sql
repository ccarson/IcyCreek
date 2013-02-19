
CREATE PROCEDURE [dbo].[mc_contact] ( 
	@systemID AS INT, @tableID AS INT
    , @recordsIN AS INT, @dataXML AS XML
    , @operation AS NVARCHAR(20), @errorMessage AS NVARCHAR(50) OUTPUT )
AS 
BEGIN
    SET NOCOUNT ON ;
	
    DECLARE @sql AS NVARCHAR(4000) ;
    DECLARE @newLegacyID AS INT ;
	
    IF @operation = 'INSERT' 
    BEGIN 
		CREATE TABLE #legacyIDs ( 
			newContactsID UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID()
			, legacyID INT ) ;
			
		SET @newLegacyID = (
			SELECT MAX(vw_transitionContacts.ContactsID)
			FROM dbo.vw_transitionContacts ) ;
				
		INSERT INTO #legacyIDs ( legacyID )
		SELECT @newLegacyID + ROW_NUMBER() OVER ( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') )
		FROM @dataXML.nodes('i/data') AS i ( data ) ;
		
		SELECT  @newLegacyID + ROW_NUMBER() OVER ( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') ) AS legacyID
			, i.data.value('@Salutation[1]', 'nvarchar(20)') AS Salutation
			, i.data.value('@JobTitle[1]', 'nvarchar(255)') AS JobTitle
			, i.data.value('@Firstname[1]', 'nvarchar(50)') AS Firstname
			, i.data.value('@Initial[1]', 'nvarchar(50)') AS Initial
			, i.data.value('@Lastname[1]', 'nvarchar(50)') AS Lastname
			, i.data.value('@Suffix[1]', 'nvarchar(20)') AS Suffix
			, i.data.value('@Email[1]', 'nvarchar(50)') AS Email
			, i.data.value('@Login[1]', 'nvarchar(50)') AS Login
			, i.data.value('@Password[1]', 'nvarchar(500)') AS Password
			, i.data.value('@salt[1]', 'nvarchar(35)') AS salt
			, i.data.value('@AccessID[1]', 'int') AS AccessID
			, i.data.value('@Expires[1]', 'datetime2') AS Expires
			, i.data.value('@Hits[1]', 'int') AS Hits
			, i.data.value('@LastLogin[1]', 'datetime2') AS LastLogin
			, i.data.value('@Status[1]', 'nvarchar(20)') AS Status
			, i.data.value('@ModifiedBy[1]', 'nvarchar(50)') AS ModifiedBy
			, i.data.value('@DateModified[1]', 'datetime2') AS DateModified
			, i.data.value('@datejoined[1]', 'datetime2') AS datejoined
			, i.data.value('@membertype[1]', 'int') AS membertype
			, i.data.value('@photo[1]', 'nvarchar(120)') AS photo
			, i.data.value('@resume[1]', 'nvarchar(120)') AS resume
			, i.data.value('@thumb[1]', 'nvarchar(120)') AS thumb
			, i.data.value('@PIN[1]', 'int') AS PIN
			, i.data.value('@reset[1]', 'bit') AS reset
			, i.data.value('@mailsent[1]', 'bit') AS mailsent
			, i.data.value('@sysmember[1]', 'int') AS sysmember
			, i.data.value('@maildate[1]', 'datetime2') AS maildate
			, i.data.value('@updatesent[1]', 'datetime2') AS updatesent
			, i.data.value('@updatenum[1]', 'int') AS updatenum
			, i.data.value('@nosend[1]', 'bit') AS nosend
			, i.data.value('@hidden[1]', 'bit') AS hidden
			, i.data.value('@security_level[1]', 'int') AS security_level
			, i.data.value('@review[1]', 'bit') AS review
			, i.data.value('@Q1[1]', 'nvarchar(50)') AS Q1
			, i.data.value('@Q2[1]', 'nvarchar(50)') AS Q2
			, i.data.value('@Q3[1]', 'nvarchar(50)') AS Q3
			, i.data.value('@iAnswer[1]', 'nvarchar(50)') AS iAnswer
			, i.data.value('@ipMac[1]', 'nvarchar(100)') AS ipMac
			, i.data.value('@frequency_id[1]', 'int') AS frequency_id
			, i.data.value('@refer[1]', 'int') AS refer
			, i.data.value('@is_active[1]', 'bit') AS is_active
			, i.data.value('@TimeZone[1]', 'nvarchar(35)') AS TimeZone
			, i.data.value('@usesDaylight[1]', 'bit') AS usesDaylight
			, i.data.value('@TzOffset[1]', 'int') AS TzOffset
			, i.data.value('@iDefault_Quota[1]', 'int') AS iDefault_Quota
			, i.data.value('@iDoc_Usage[1]', 'decimal') AS iDoc_Usage
			, i.data.value('@assist_id[1]', 'int') AS assist_id
			, i.data.value('@layout[1]', 'int') AS layout
			, i.data.value('@bTOS[1]', 'bit') AS bTOS
			, i.data.value('@bOnlineNow[1]', 'bit') AS bOnlineNow
			, i.data.value('@uID[1]', 'nvarchar(35)') AS uID
			, i.data.value('@iwkgrplayout[1]', 'int') AS iwkgrplayout
			, i.data.value('@sAboutMe[1]', 'nvarchar(500)') AS sAboutMe
			, i.data.value('@folder_id[1]', 'int') AS folder_id
			, i.data.value('@signature[1]', 'nvarchar(2500)') AS signature
			, i.data.value('@dateAdded[1]', 'datetime2') AS dateAdded
			, i.data.value('@addedBy[1]', 'int') AS addedBy
			, i.data.value('@bAuditLock[1]', 'bit') AS bAuditLock
			, i.data.value('@bProfileUpdate[1]', 'bit') AS bProfileUpdate
			, i.data.value('@bexpirereminder[1]', 'bit') AS bexpirereminder
			, i.data.value('@bPingSent[1]', 'bit') AS bPingSent
			, i.data.value('@dPingDate[1]', 'datetime2') AS dPingDate
			, i.data.value('@bVerified[1]', 'bit') AS bVerified
			, i.data.value('@iVerifiedBy[1]', 'int') AS iVerifiedBy
			, i.data.value('@dVerifiedDate[1]', 'datetime2') AS dVerifiedDate
			, i.data.value('@inetwork[1]', 'int') AS inetwork 
			, i.data.value('@isSuspect[1]', 'int') AS isSuspect
		INTO #inserts
		FROM @dataXML.nodes('i/data') AS i ( data ) ;	
		
		INSERT INTO dbo.Contacts ( 
			id, Salutation, JobTitle, Firstname, Initial, Lastname, Suffix
			, Email, Login, Password, salt, AccessID, Expires, Hits, LastLogin
			, Status, ModifiedBy, DateModified, datejoined, membertype, photo
			, resume, thumb, PIN, reset, mailsent, sysmember, maildate, updatesent
			, updatenum, nosend, hidden, security_level, review, Q1, Q2, Q3
			, iAnswer, ipMac, frequency_id, refer, is_active, TimeZone, usesDaylight
			, TzOffset, iDefault_Quota, iDoc_Usage, assist_id, layout, bTOS
			, bOnlineNow, uID, iwkgrplayout, sAboutMe, folder_id, signature
			, dateAdded, addedBy, bAuditLock, bProfileUpdate, bexpirereminder
			, bPingSent, dPingDate, bVerified, verifiedBy, dVerifiedDate, inetwork, isSuspect ) 
		SELECT  l.newContactsID, i.Salutation, i.JobTitle, i.Firstname, i.Initial, i.Lastname, i.Suffix
			, i.Email, i.Login, i.Password, i.salt, i.AccessID, i.Expires, i.Hits, i.LastLogin
			, i.Status, i.ModifiedBy, i.DateModified, i.datejoined, i.membertype, i.photo
			, i.resume, i.thumb, i.PIN, i.reset, i.mailsent, i.sysmember, i.maildate, i.updatesent
			, i.updatenum, i.nosend, i.hidden, i.security_level, i.review, i.Q1, i.Q2, i.Q3
			, i.iAnswer, i.ipMac, i.frequency_id, i.refer, i.is_active, i.TimeZone, i.usesDaylight
			, i.TzOffset, i.iDefault_Quota, i.iDoc_Usage, i.assist_id, i.layout, i.bTOS
			, i.bOnlineNow, i.uID, i.iwkgrplayout, i.sAboutMe, i.folder_id, i.signature
			, i.dateAdded, tc1.id, i.bAuditLock, i.bProfileUpdate, i.bexpirereminder
			, i.bPingSent, i.dPingDate, i.bVerified, tc2.id, i.dVerifiedDate, i.inetwork, i.isSuspect
		FROM #inserts AS i 
		INNER JOIN #legacyIDs AS l ON i.legacyID = l.legacyID 
		INNER JOIN dbo.vw_transitionContacts AS tc1 ON tc1.contactsID = i.addedBy 
			AND tc1.transitionSystemsID = @systemID 
		LEFT OUTER JOIN dbo.vw_transitionContacts AS tc2 ON tc2.contactsID = i.iVerifiedBy 
			AND tc2.transitionSystemsID = @systemID ;

		IF @@ROWCOUNT <> @recordsIN 
		BEGIN
			SET @errorMessage = N'INSERT failed! ' + 
					CAST(@recordsIN AS NVARCHAR(10)) + N' records in, ' + 
					CAST(@@ROWCOUNT AS NVARCHAR(10)) + N' records inserted.' ;
			PRINT @errorMessage ;
			RETURN 16 ;
		END

		INSERT INTO dbo.transitionIdentities ( 
			id, transitionSystemsID, convertedTableID, legacyID )
		SELECT newContactsID, @systemID, @tableID, LegacyID
		FROM #legacyIDs ;
	END

    IF @operation = 'UPDATE' 
	BEGIN 
		SELECT u.data.value('@id[1]', 'int') AS id
			, u.data.value('@Salutation[1]', 'nvarchar(20)') AS Salutation
			, u.data.value('@JobTitle[1]', 'nvarchar(255)') AS JobTitle
			, u.data.value('@Firstname[1]', 'nvarchar(50)') AS Firstname
			, u.data.value('@Initial[1]', 'nvarchar(50)') AS Initial
			, u.data.value('@Lastname[1]', 'nvarchar(50)') AS Lastname
			, u.data.value('@Suffix[1]', 'nvarchar(20)') AS Suffix
			, u.data.value('@Email[1]', 'nvarchar(50)') AS Email
			, u.data.value('@Login[1]', 'nvarchar(50)') AS Login
			, u.data.value('@Password[1]', 'nvarchar(500)') AS Password
			, u.data.value('@salt[1]', 'nvarchar(35)') AS salt
			, u.data.value('@AccessID[1]', 'int') AS AccessID
			, u.data.value('@Expires[1]', 'datetime2') AS Expires
			, u.data.value('@Hits[1]', 'int') AS Hits
			, u.data.value('@LastLogin[1]', 'datetime2') AS LastLogin
			, u.data.value('@Status[1]', 'nvarchar(20)') AS Status
			, u.data.value('@ModifiedBy[1]', 'nvarchar(50)') AS ModifiedBy
			, u.data.value('@DateModified[1]', 'datetime2') AS DateModified
			, u.data.value('@datejoined[1]', 'datetime2') AS datejoined
			, u.data.value('@membertype[1]', 'int') AS membertype
			, u.data.value('@photo[1]', 'nvarchar(120)') AS photo
			, u.data.value('@resume[1]', 'nvarchar(120)') AS resume
			, u.data.value('@thumb[1]', 'nvarchar(120)') AS thumb
			, u.data.value('@PIN[1]', 'int') AS PIN
			, u.data.value('@reset[1]', 'bit') AS reset
			, u.data.value('@mailsent[1]', 'bit') AS mailsent
			, u.data.value('@sysmember[1]', 'int') AS sysmember
			, u.data.value('@maildate[1]', 'datetime2') AS maildate
			, u.data.value('@updatesent[1]', 'datetime2') AS updatesent
			, u.data.value('@updatenum[1]', 'int') AS updatenum
			, u.data.value('@nosend[1]', 'bit') AS nosend
			, u.data.value('@hidden[1]', 'bit') AS hidden
			, u.data.value('@security_level[1]', 'int') AS security_level
			, u.data.value('@review[1]', 'bit') AS review
			, u.data.value('@Q1[1]', 'nvarchar(50)') AS Q1
			, u.data.value('@Q2[1]', 'nvarchar(50)') AS Q2
			, u.data.value('@Q3[1]', 'nvarchar(50)') AS Q3
			, u.data.value('@iAnswer[1]', 'nvarchar(50)') AS iAnswer
			, u.data.value('@ipMac[1]', 'nvarchar(100)') AS ipMac
			, u.data.value('@frequency_id[1]', 'int') AS frequency_id
			, u.data.value('@refer[1]', 'int') AS refer
			, u.data.value('@is_active[1]', 'bit') AS is_active
			, u.data.value('@TimeZone[1]', 'nvarchar(35)') AS TimeZone
			, u.data.value('@usesDaylight[1]', 'bit') AS usesDaylight
			, u.data.value('@TzOffset[1]', 'int') AS TzOffset
			, u.data.value('@iDefault_Quota[1]', 'int') AS iDefault_Quota
			, u.data.value('@iDoc_Usage[1]', 'decimal') AS iDoc_Usage
			, u.data.value('@assist_id[1]', 'int') AS assist_id
			, u.data.value('@layout[1]', 'int') AS layout
			, u.data.value('@bTOS[1]', 'bit') AS bTOS
			, u.data.value('@bOnlineNow[1]', 'bit') AS bOnlineNow
			, u.data.value('@uID[1]', 'nvarchar(36)') AS uID
			, u.data.value('@iwkgrplayout[1]', 'int') AS iwkgrplayout
			, u.data.value('@sAboutMe[1]', 'nvarchar(500)') AS sAboutMe
			, u.data.value('@folder_id[1]', 'int') AS folder_id
			, u.data.value('@signature[1]', 'nvarchar(2500)') AS signature
			, u.data.value('@dateAdded[1]', 'datetime2') AS dateAdded
			, u.data.value('@addedBy[1]', 'int') AS addedBy
			, u.data.value('@bAuditLock[1]', 'bit') AS bAuditLock
			, u.data.value('@bProfileUpdate[1]', 'bit') AS bProfileUpdate
			, u.data.value('@bexpirereminder[1]', 'bit') AS bexpirereminder
			, u.data.value('@bPingSent[1]', 'bit') AS bPingSent
			, u.data.value('@dPingDate[1]', 'datetime2') AS dPingDate
			, u.data.value('@bVerified[1]', 'bit') AS bVerified
			, u.data.value('@iVerifiedBy[1]', 'int') AS iVerifiedBy
			, u.data.value('@dVerifiedDate[1]', 'datetime2') AS dVerifiedDate
			, u.data.value('@inetwork[1]', 'int') AS inetwork
			, u.data.value('@isSuspect[1]', 'int') AS isSuspect
		INTO #updates
		FROM    @dataXML.nodes('u/data') AS u ( data ) ;	

		UPDATE  dbo.Contacts SET
			Salutation = u.Salutation
			, JobTitle = u.JobTitle
			, Firstname = u.Firstname
			, Initial = u.Initial
			, Lastname = u.Lastname
			, Suffix = u.Suffix
			, Email = u.Email
			, Login = u.Login
			, Password = u.Password
			, salt = u.salt
			, AccessID = u.AccessID
			, Expires = u.Expires
			, Hits = u.Hits
			, LastLogin = u.LastLogin
			, Status = u.Status
			, ModifiedBy = u.ModifiedBy
			, DateModified = u.DateModified
			, datejoined = u.datejoined
			, membertype = u.membertype
			, photo = u.photo
			, resume = u.resume
			, thumb = u.thumb
			, PIN = u.PIN
			, reset = u.reset
			, mailsent = u.mailsent
			, sysmember = u.sysmember
			, maildate = u.maildate
			, updatesent = u.updatesent
			, updatenum = u.updatenum
			, nosend = u.nosend
			, hidden = u.hidden
			, security_level = u.security_level
			, review = u.review
			, Q1 = u.Q1
			, Q2 = u.Q2
			, Q3 = u.Q3
			, iAnswer = u.iAnswer
			, ipMac = u.ipMac
			, frequency_id = u.frequency_id
			, refer = u.refer
			, is_active = u.is_active
			, TimeZone = u.TimeZone
			, usesDaylight = u.usesDaylight
			, TzOffset = u.TzOffset
			, iDefault_Quota = u.iDefault_Quota
			, iDoc_Usage = u.iDoc_Usage
			, assist_id = u.assist_id
			, layout = u.layout
			, bTOS = u.bTOS
			, bOnlineNow = u.bOnlineNow
			, uID = u.uID
			, iwkgrplayout = u.iwkgrplayout
			, sAboutMe = u.sAboutMe
			, folder_id = u.folder_id
			, signature = u.signature
			, dateAdded = u.dateAdded
			, bAuditLock = u.bAuditLock
			, bProfileUpdate = u.bProfileUpdate
			, bexpirereminder = u.bexpirereminder
			, bPingSent = u.bPingSent
			, dPingDate = u.dPingDate
			, bVerified = u.bVerified
			, verifiedBy = tc2.id
			, dVerifiedDate = u.dVerifiedDate
			, inetwork = u.inetwork
			, isSuspect = u.isSuspect
		FROM dbo.Contacts AS c
		INNER JOIN dbo.vw_transitionContacts AS tc1 ON c.id = tc1.ID
			AND tc1.transitionSystemsID = @systemID 		
		INNER JOIN #updates AS u ON u.id = tc1.ContactsID
			AND tc1.transitionSystemsID = @systemID 	
		LEFT OUTER JOIN dbo.vw_transitionContacts AS tc2 ON tc2.contactsID = u.iVerifiedBy
			AND tc2.transitionSystemsID = @systemID ;
		
		IF ( @@ROWCOUNT <> @recordsIN ) 
		BEGIN
			SET @errorMessage = N'UPDATE failed! ' + 
					CAST(@recordsIN AS NVARCHAR(50)) + N' records in, ' + 
					CAST(@@ROWCOUNT AS NVARCHAR(50)) + N' records updated.' ;
			PRINT @errorMessage ;
			RETURN 16 ;
		END
	END
	
    IF @operation = 'DELETE' 
	BEGIN 
		SELECT d.data.value('@id[1]', 'int') AS ID
		INTO #deletes
		FROM @dataXML.nodes('d/data') AS d ( data ) ;
		
		DELETE FROM dbo.vw_transitionContacts
		WHERE EXISTS ( 
			SELECT * FROM #deletes AS d
			WHERE d.id = dbo.vw_transitionContacts.contactsID 
				AND vw_transitionContacts.transitionSystemsID = @systemID ) ; 
				
		IF @@ROWCOUNT <> @recordsIN 
		BEGIN
			SET @errorMessage = N'DELETE failed! ' + 
				CAST(@recordsIN AS NVARCHAR(10)) + N' records in, ' + 
				CAST(@@ROWCOUNT AS NVARCHAR(10)) + N' records DELETED.' ;
			PRINT @errorMessage ; 
            RETURN 16 ;
		END							
		
        DELETE FROM dbo.Contacts
		WHERE NOT EXISTS ( 
			SELECT * FROM dbo.transitionIdentities
			WHERE dbo.Contacts.id = dbo.transitionIdentities.id ) ;
	END
		
END


