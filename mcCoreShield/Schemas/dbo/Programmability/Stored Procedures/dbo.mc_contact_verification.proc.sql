CREATE PROCEDURE [dbo].[mc_contact_verification] (
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
			newContactVerificationsID uniqueidentifier DEFAULT NEWSEQUENTIALID(), 
			legacyID int );
		
		SET @newLegacyID = ( 
			SELECT MAX(contactVerificationsID)
			FROM dbo.vw_transitionContactVerifications );
			
		INSERT INTO #legacyIDs ( legacyID )
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') )
		FROM @dataXML.nodes('i/data') AS i(data);
	
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER ( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') ) as legacyID
			, i.data.value('@user_id[1]', 'int') AS user_id
			, i.data.value('@verified_by[1]', 'int') AS verified_by
			, i.data.value('@verified_date[1]', 'datetime2') AS verified_date
		into #inserts
		FROM @dataXML.nodes('i/data') AS i(data);	
		
		INSERT INTO dbo.ContactVerifications (
			id, ContactsID, verified_by, verified_date )
		SELECT 
			l.newContactVerificationsID, c1.id, c2.id, verified_date
		FROM #inserts
		INNER JOIN #legacyIDs AS l ON #inserts.legacyID = l.legacyID
		INNER JOIN dbo.vw_transitionContacts AS c1 ON #inserts.user_id = c1.contactsID 
			AND c1.transitionSystemsID = @systemID
		INNER JOIN dbo.vw_transitionContacts AS c2 ON #inserts.verified_by = c2.contactsID 
			AND	c2.transitionSystemsID = @systemID;

		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'INSERT failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records inserted.';
			RETURN 16;
		END
			
		INSERT INTO dbo.transitionIdentities (
			id, transitionSystemsID, convertedTableID, legacyID )
		SELECT newContactVerificationsID, @systemID, @tableID, legacyID
		FROM #legacyIDs; 
	end

	IF @operation = 'UPDATE'
	BEGIN 
		SELECT u.data.value('@id[1]', 'int') AS id
			, u.data.value('@verified_by[1]', 'int') AS verified_by
			, u.data.value('@verified_date[1]', 'datetime2') AS verified_date
		INTO #updates
		FROM @dataXML.nodes('u/data') AS u(data);				
	
		UPDATE dbo.ContactVerifications
		SET verified_by = c.id
			, verified_date = #updates.verified_date		
		FROM #updates
		INNER JOIN dbo.vw_transitionContactVerifications AS v ON #updates.id = v.ContactVerificationsID 
			AND	v.transitionSystemsID = @systemID
		INNER JOIN dbo.ContactVerifications AS cv ON v.id = cv.id
			AND	v.transitionSystemsID = @systemID
		INNER JOIN dbo.vw_transitionContacts AS c ON #updates.verified_by = c.contactsID 
			AND	c.transitionSystemsID = @systemID;

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
		
		DELETE FROM dbo.vw_transitionContactVerifications
		WHERE EXISTS (
			SELECT * FROM #deletes AS d
			WHERE d.id = dbo.vw_transitionContactVerifications.ContactVerificationsID AND
				transitionSystemsID = @systemID ); 
				
		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'DELETE failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records DELETED.';
			RETURN 16;
		END							
		
		DELETE FROM dbo.ContactVerifications
		WHERE NOT EXISTS (
			SELECT * FROM dbo.transitionIdentities
			WHERE ContactVerifications.id = dbo.transitionIdentities.id );
		
	END
		
END


