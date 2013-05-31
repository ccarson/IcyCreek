CREATE PROCEDURE [dbo].[mc_contact_addresses] (
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
			newContactAddressesID uniqueidentifier DEFAULT NEWSEQUENTIALID()
			, legacyID int ) ;
		
		SET @newLegacyID = ( 
			SELECT MAX(contactAddressesID)
			FROM dbo.vw_transitionContactAddresses ) ;
			
		INSERT INTO #legacyIDs ( legacyID )
		SELECT @newLegacyID + ROW_NUMBER() OVER( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') )
		FROM @dataXML.nodes('i/data') AS i(data) ;
	
		SELECT @newLegacyID + ROW_NUMBER() OVER ( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') ) as legacyID
			, i.data.value('@add_type[1]', 'int') AS add_type
			, i.data.value('@address1[1]', 'nvarchar(200)') AS address1
			, i.data.value('@address2[1]', 'nvarchar(200)') AS address2
			, i.data.value('@address3[1]', 'nvarchar(200)') AS address3
			, i.data.value('@city[1]', 'nvarchar(150)') AS city
			, i.data.value('@state[1]', 'nvarchar(50)') AS state
			, i.data.value('@zip[1]', 'nvarchar(20)') AS zip
			, i.data.value('@country[1]', 'nvarchar(20)') AS country
			, i.data.value('@user_id[1]', 'int') AS user_id
			, i.data.value('@defaultaddress[1]', 'bit') AS defaultaddress
			, i.data.value('@name[1]', 'nvarchar(100)') AS name
			, i.data.value('@createdDate[1]', 'datetime2') AS createdDate		
		into #inserts
		FROM @dataXML.nodes('i/data') AS i(data) ;	
		
		INSERT INTO dbo.ContactAddresses (
			id, ContactsID, add_type, address1, address2, address3
			, city, state, zip, country, defaultaddress, name, createdDate )
		SELECT 
			l.newContactAddressesID, c.id, i.add_type, i.address1, i.address2, i.address3
			, i.city, i.state, i.zip, i.country, i.defaultaddress, i.name, i.createdDate
		FROM #inserts AS i
		INNER JOIN #legacyIDs AS l ON i.legacyID = l.legacyID
		INNER JOIN dbo.ContactSystems AS c ON i.user_id = c.mc_contactID AND c.systemID = @systemID ;

		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'INSERT failed! ' + 
					CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
					CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records inserted.' ;
			RETURN 16 ;
		END			
			
		INSERT INTO dbo.transitionIdentities (
			id, transitionSystemsID, convertedTableID, legacyID )
		SELECT newContactAddressesID, @systemID, @tableID, legacyID
		FROM #legacyIDs ;	
	END

	IF @operation = 'UPDATE'
	BEGIN 
		SELECT u.data.value('@id[1]', 'int') AS id
			, u.data.value('@add_type[1]', 'int') AS add_type
			, u.data.value('@user_id[1]', 'int') AS user_id				
			, u.data.value('@address1[1]', 'nvarchar(200)') AS address1
			, u.data.value('@address2[1]', 'nvarchar(200)') AS address2
			, u.data.value('@address3[1]', 'nvarchar(200)') AS address3
			, u.data.value('@city[1]', 'nvarchar(150)') AS city
			, u.data.value('@state[1]', 'nvarchar(50)') AS state
			, u.data.value('@zip[1]', 'nvarchar(20)') AS zip
			, u.data.value('@country[1]', 'nvarchar(20)') AS country
			, u.data.value('@defaultaddress[1]', 'bit') AS defaultaddress
			, u.data.value('@name[1]', 'nvarchar(100)') AS name
			, u.data.value('@createdDate[1]', 'datetime2') AS createdDate
		into #updates
		FROM @dataXML.nodes('u/data') AS u(data) ;				
	
		UPDATE dbo.ContactAddresses 
		SET add_type = u.add_type
			, ContactsID = tc.id			
			, address1 = u.address1
			, address2 = u.address2
			, address3 = u.address3
			, city = u.city
			, state = u.state
			, zip = u.zip
			, country = u.country
			, defaultaddress = u.defaultaddress
			, name = u.name
			, createdDate = u.createdDate
		FROM dbo.ContactAddresses AS ca 
		INNER JOIN dbo.vw_transitionContactAddresses AS ta ON ta.id = ca.id
			AND ta.transitionSystemsID = @systemID
		INNER JOIN #updates AS u on u.id = ta.ContactAddressesID
			AND ta.transitionSystemsID = @systemID
		INNER JOIN dbo.ContactSystems AS tc ON tc.mc_contactID = u.user_id AND tc.systemID = @systemID;
			
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
		
		DELETE FROM dbo.vw_transitionContactAddresses
		WHERE EXISTS (
			SELECT * FROM #deletes AS d
			WHERE d.id = dbo.vw_transitionContactAddresses.ContactAddressesID 
				AND transitionSystemsID = @systemID ); 
		
		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'DELETE failed! ' + 
					CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
					CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records DELETED.';
			RETURN 16;
		END	
		
		DELETE FROM dbo.ContactAddresses
		WHERE NOT EXISTS (
			SELECT * FROM dbo.transitionIdentities
			WHERE ContactAddresses.id = dbo.transitionIdentities.id );
		
	END
		
END
