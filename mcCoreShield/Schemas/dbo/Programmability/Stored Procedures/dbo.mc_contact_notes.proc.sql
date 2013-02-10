CREATE PROCEDURE [dbo].[mc_contact_notes] (
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
			newContactNotesID uniqueidentifier DEFAULT NEWSEQUENTIALID(), 
			legacyID int );
		
		SET @newLegacyID = ( 
			SELECT ISNULL(MAX(ContactNotesID),0)
			FROM dbo.vw_transitionContactNotes );
			
		INSERT INTO #legacyIDs ( legacyID )
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') )
		FROM @dataXML.nodes('i/data') AS i(data);
	
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER ( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') ) as legacyID
			, i.data.value('@user_id[1]', 'int') AS user_id
			, i.data.value('@notes[1]', 'nvarchar(1000)') AS notes
			, i.data.value('@admin_id[1]', 'int') AS admin_id
			, i.data.value('@dateAdded[1]', 'datetime2') AS dateAdded
			, i.data.value('@type_id[1]', 'int') AS type_id
		into #inserts
		FROM @dataXML.nodes('i/data') AS i(data);	
		
		INSERT INTO dbo.ContactNotes (
			id, ContactsID, notes, adminID, dateAdded, type_id )
		SELECT 
			l.newContactNotesID, tc1.id, notes, tc2.id, dateAdded, type_id
		FROM #inserts AS i
		INNER JOIN #legacyIDs AS l ON i.legacyID = l.legacyID
		INNER JOIN dbo.vw_transitionContacts AS tc1	ON i.user_id = tc1.contactsID
			AND tc1.transitionSystemsID = @systemID
		INNER JOIN dbo.vw_transitionContacts AS tc2 ON i.admin_id = tc2.contactsID
			AND tc2.transitionSystemsID = @systemID;

		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'INSERT failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records inserted.';
			RETURN 16;
		END
		
		INSERT INTO dbo.transitionIdentities (
			id, transitionSystemsID, convertedTableID, legacyID )
		SELECT newContactNotesID, @systemID, @tableID, legacyID
		FROM #legacyIDs;
	
	END

	IF @operation = 'UPDATE'
	BEGIN 
		SELECT u.data.value('@id[1]', 'int') AS id
			, u.data.value('@user_id[1]', 'int') AS user_id
			, u.data.value('@notes[1]', 'nvarchar(1000)') AS notes
			, u.data.value('@admin_id[1]', 'int') AS admin_id
			, u.data.value('@dateAdded[1]', 'datetime2') AS dateAdded
			, u.data.value('@type_id[1]', 'int') AS type_id
		INTO #updates
		FROM @dataXML.nodes('u/data') AS u(data);				
	
		UPDATE dbo.ContactNotes
		SET ContactsID = tc1.id
			, notes = u.notes
			, adminID = tc2.id
			, dateAdded = u.dateAdded
			, type_id = u.type_id
		FROM #updates as u
		INNER JOIN dbo.vw_transitionContactNotes AS tn ON u.id = tn.ContactNotesID
			AND tn.transitionSystemsID = @systemID
		INNER JOIN dbo.ContactNotes as cn ON cn.id = tn.id
			AND tn.transitionSystemsID = @systemID
		INNER JOIN dbo.vw_transitionContacts AS tc1 ON u.user_id = tc1.contactsID 
			AND tc1.transitionSystemsID = @systemID
		INNER JOIN dbo.vw_transitionContacts AS tc2 ON u.admin_id = tc2.contactsID 
			AND tc2.transitionSystemsID = @systemID;
			
		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'UPDATE failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records UPDATED.';
			RETURN 16;
		END			
		
	END
	
	IF @operation = 'DELETE'
	BEGIN 
		SELECT d.data.value('@id[1]', 'int') AS ID
		into #deletes
		FROM @dataXML.nodes('d/data') AS d(data);		

		DELETE FROM dbo.vw_transitionContactNotes
		WHERE EXISTS (
			SELECT * FROM #deletes AS d
			WHERE d.id = dbo.vw_transitionContactNotes.ContactNotesID
				AND transitionSystemsID = @systemID );
		
		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'DELETE failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records DELETED.';
			RETURN 16;
		END				
				
		DELETE FROM dbo.ContactNotes
		WHERE NOT EXISTS (
			SELECT * FROM dbo.transitionIdentities
			WHERE dbo.ContactNotes.id = dbo.transitionIdentities.id );
		
	END
		
END


