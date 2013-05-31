CREATE PROCEDURE [dbo].[mc_contact_phones] (
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
			newContactPhonesID uniqueidentifier DEFAULT NEWSEQUENTIALID(), 
			legacyID int );
		
		SET @newLegacyID = ( 
			SELECT MAX(contactPhonesID)
			FROM dbo.vw_transitionContactPhones );
			
		INSERT INTO #legacyIDs ( legacyID )
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') )
		FROM @dataXML.nodes('i/data') AS i(data);
	
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER ( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') ) as legacyID
			, i.data.value('@phone[1]', 'nvarchar(100)') AS phone
			, i.data.value('@user_id[1]', 'int') AS user_id
			, i.data.value('@type_id[1]', 'int') AS type_id
			, i.data.value('@edefault[1]', 'bit') AS edefault
			, i.data.value('@active[1]', 'bit') AS active
			, i.data.value('@epublic[1]', 'bit') AS epublic
			, i.data.value('@extension[1]', 'nvarchar(10)') AS extension
			, i.data.value('@alert[1]', 'bit') AS alert
			, i.data.value('@is_emergency[1]', 'bit') AS is_emergency
		into #inserts
		FROM @dataXML.nodes('i/data') AS i(data);	
		
		INSERT INTO dbo.ContactPhones (
			id, ContactsID, phone, type_id, edefault
			, active, epublic, extension, alert, is_emergency )
		SELECT 
			l.newContactPhonesID, c.id, phone, type_id, edefault
			, active, epublic, extension, alert, is_emergency
		FROM #inserts as i
		INNER JOIN #legacyIDs as l on i.legacyID = l.legacyID
		INNER JOIN dbo.ContactSystems AS c ON i.user_id = c.mc_contactID AND c.systemID = @systemID;

		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'INSERT failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records inserted.';
			RETURN 16;
		END
			
		INSERT INTO dbo.transitionIdentities (
			id, transitionSystemsID, convertedTableID, legacyID )
		SELECT newContactPhonesID, @systemID, @tableID, legacyID
		FROM #legacyIDs; 
	end

	IF @operation = 'UPDATE'
	BEGIN 
		SELECT u.data.value('@id[1]', 'int') AS id
			, u.data.value('@phone[1]', 'nvarchar(100)') AS phone
			, u.data.value('@user_id[1]', 'int') AS user_id
			, u.data.value('@type_id[1]', 'int') AS type_id
			, u.data.value('@edefault[1]', 'bit') AS edefault
			, u.data.value('@active[1]', 'bit') AS active
			, u.data.value('@epublic[1]', 'bit') AS epublic
			, u.data.value('@extension[1]', 'nvarchar(10)') AS extension
			, u.data.value('@alert[1]', 'bit') AS alert
			, u.data.value('@is_emergency[1]', 'bit') AS is_emergency			
		INTO #updates
		FROM @dataXML.nodes('u/data') AS u(data);				
	
		UPDATE dbo.ContactPhones
		SET phone = u.phone
			, ContactsID = c.id
			, type_id = u.type_id
			, edefault = u.edefault
			, active = u.active
			, epublic = u.epublic
			, extension = u.extension
			, alert = u.alert
			, is_emergency = u.is_emergency
		FROM #updates AS u
		INNER JOIN dbo.vw_transitionContactPhones AS p ON u.id = p.ContactPhonesID 
			AND p.transitionSystemsID = @systemID
		INNER JOIN dbo.ContactPhones AS cp on p.id = cp.id 
			AND p.transitionSystemsID = @systemID
		INNER JOIN dbo.ContactSystems AS c ON u.user_id = c.mc_contactID 
			AND c.systemID = @systemID;

		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'INSERT failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records inserted.';
			RETURN 16;
		END
		
	END
	
	IF @operation = 'DELETE'
	BEGIN 
		SELECT d.data.value('@id[1]', 'int') AS ID
		into #deletes
		FROM @dataXML.nodes('d/data') AS d(data);				
		
		DELETE FROM dbo.vw_transitionContactPhones
		WHERE EXISTS (
			SELECT * FROM #deletes AS d
			WHERE d.id = dbo.vw_transitionContactPhones.ContactPhonesID AND
				transitionSystemsID = @systemID ); 
				
		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'DELETE failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records DELETED.';
			RETURN 16;
		END							
		
		DELETE FROM dbo.ContactPhones
		WHERE NOT EXISTS (
			SELECT * FROM dbo.transitionIdentities
			WHERE ContactPhones.id = dbo.transitionIdentities.id );
		
	END
		
END
