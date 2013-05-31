CREATE PROCEDURE [dbo].[mc_contact_emails] (
	@systemID AS INT
	, @tableID AS INT
	, @recordsIN AS INT
	, @dataXML AS XML
	, @operation AS NVARCHAR(20)
	, @errorMessage AS NVARCHAR(50) OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql AS NVARCHAR(4000);
	DECLARE @newLegacyID AS INT;
	
	IF @operation = 'INSERT'
	BEGIN 
		CREATE TABLE #legacyIDs (
			newContactEmailsID uniqueidentifier DEFAULT NEWSEQUENTIALID(), 
			legacyID int );
		
		SET @newLegacyID = ( 
			SELECT MAX(contactEmailsID)
			FROM dbo.vw_transitionContactEmails );
			
		INSERT INTO #legacyIDs ( legacyID )
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') )
		FROM @dataXML.nodes('i/data') AS i(data);
	
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER ( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') ) as legacyID
			, i.data.value('@email[1]', 'nvarchar(60)') AS email
			, i.data.value('@user_id[1]', 'int') AS user_id
			, i.data.value('@type_id[1]', 'int') AS type_id
			, i.data.value('@edefault[1]', 'bit') AS edefault
			, i.data.value('@active[1]', 'bit') AS active
			, i.data.value('@epublic[1]', 'bit') AS epublic
			, i.data.value('@alert[1]', 'bit') AS alert
			, i.data.value('@is_emergency[1]', 'bit') AS is_emergency
		into #inserts
		FROM @dataXML.nodes('i/data') AS i(data);	
		
		INSERT INTO dbo.ContactEmails (
			id, ContactsID, email, type_id, edefault
			, active, epublic, alert, is_emergency )
		SELECT 
			l.newContactEmailsID, tc.id, i.email, i.type_id, i.edefault
			, i.active, i.epublic, i.alert, i.is_emergency
		FROM #inserts AS i
		INNER JOIN #legacyIDs AS l ON i.legacyID = l.legacyID
		INNER JOIN dbo.ContactSystems AS tc ON i.user_id = tc.mc_contactID AND tc.systemID = @systemID;

		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'INSERT failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records inserted.';
			RETURN 16;
		END
		
		INSERT INTO dbo.transitionIdentities (
			id, transitionSystemsID, convertedTableID, legacyID )
		SELECT newContactEmailsID, @systemID, @tableID, legacyID
		FROM #legacyIDs;		
			
	end

	IF @operation = 'UPDATE'
	BEGIN 
		SELECT u.data.value('@id[1]', 'int') AS id
			, u.data.value('@email[1]', 'nvarchar(60)') AS email
			, u.data.value('@user_id[1]', 'int') AS user_id			
			, u.data.value('@type_id[1]', 'int') AS type_id
			, u.data.value('@edefault[1]', 'bit') AS edefault
			, u.data.value('@active[1]', 'bit') AS active
			, u.data.value('@epublic[1]', 'bit') AS epublic
			, u.data.value('@alert[1]', 'bit') AS alert
			, u.data.value('@is_emergency[1]', 'bit') AS is_emergency
		INTO #updates
		FROM @dataXML.nodes('u/data') AS u(data);				
	
		UPDATE dbo.ContactEmails
		SET email = u.email
			, ContactsID = tc.id		
			, type_id = u.type_id 
			, edefault = u.edefault
			, active = u.active
			, epublic = u.epublic
			, alert = u.alert
			, is_emergency = u.is_emergency
		FROM #updates AS u
		INNER JOIN dbo.vw_transitionContactEmails AS te ON u.id = te.ContactEmailsID 
			AND te.transitionSystemsID = @systemID
		INNER JOIN dbo.ContactEmails AS e ON te.id = e.id
			AND te.transitionSystemsID = @systemID
		INNER JOIN dbo.ContactSystems AS tc ON u.user_id = tc.mc_contactID AND tc.systemID = @systemID;

		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'UPDATE failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records updated.';
			RETURN 16;
		END
		
	END
	
	IF @operation = 'DELETE'
	BEGIN 
		SELECT d.data.value('@id[1]', 'int') AS ID
		into #deletes
		FROM @dataXML.nodes('d/data') AS d(data);	
		
		DELETE FROM dbo.vw_transitionContactEmails
		WHERE EXISTS (
			SELECT * FROM #deletes AS d
			WHERE d.id = dbo.vw_transitionContactEmails.ContactEmailsID AND
				transitionSystemsID = @systemID ); 
				
		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'DELETE failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records DELETED.';
			RETURN 16;
		END							
		
		DELETE FROM dbo.ContactEmails
		WHERE NOT EXISTS (
			SELECT * FROM dbo.transitionIdentities
			WHERE ContactEmails.id = dbo.transitionIdentities.id );
		
	END
		
END
