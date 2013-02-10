CREATE PROCEDURE [dbo].[mc_org_location] (
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
			newOrgLocationsID uniqueidentifier DEFAULT NEWSEQUENTIALID(), 
			legacyID int );
		
		SET @newLegacyID = ( 
			SELECT COALESCE( MAX(OrgLocationsID), 0)
			FROM dbo.vw_transitionOrgLocations );
			
		INSERT INTO #legacyIDs ( legacyID )
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') )
		FROM @dataXML.nodes('i/data') AS i(data);
		
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER ( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') ) as legacyID
			, i.data.value('@addressTypeID[1]', 'int') AS addressTypeID			
			, i.data.value('@name[1]', 'nvarchar(75)') AS name
			, i.data.value('@address1[1]', 'nvarchar(200)') AS address1
			, i.data.value('@address2[1]', 'nvarchar(200)') AS address2
			, i.data.value('@address3[1]', 'nvarchar(200)') AS address3
			, i.data.value('@city[1]', 'nvarchar(50)') AS city
			, i.data.value('@state[1]', 'nvarchar(50)') AS state
			, i.data.value('@zip[1]', 'nvarchar(10)') AS zip
			, i.data.value('@d_phone[1]', 'nvarchar(25)') AS d_phone
			, i.data.value('@d_fax[1]', 'nvarchar(25)') AS d_fax
			, i.data.value('@org_id[1]', 'int') AS org_id
			, i.data.value('@active[1]', 'bit') AS active
			, i.data.value('@notes[1]', 'nvarchar(500)') AS notes
			, i.data.value('@country[1]', 'nvarchar(20)') AS country
			, i.data.value('@d_emergency_phone[1]', 'nvarchar(25)') AS d_emergency_phone
			, i.data.value('@d_24hr_phone[1]', 'nvarchar(25)') AS d_24hr_phone
			, i.data.value('@date_added[1]', 'datetime2') AS date_added
			, i.data.value('@date_updated[1]', 'datetime2') AS date_updated
			, i.data.value('@d_infectious_phone[1]', 'nvarchar(25)') AS d_infectious_phone
			, i.data.value('@bAlternate[1]', 'bit')	AS bAlternate		
		into #inserts
		FROM @dataXML.nodes('i/data') AS i(data);	
		
		INSERT INTO dbo.OrgLocations (
			id, organizationsID, addressTypeID, name
			, address1, address2, address3
			, city, state, zip
			, d_phone, d_fax, active
			, notes, country, d_emergency_phone, isAlternate
			, d_24hr_phone, date_added, date_updated, d_infectious_phone )
		SELECT 
			l.newOrgLocationsID, o.id, addressTypeID, name
			, address1, address2, address3
			, city, state, zip
			, d_phone, d_fax, active
			, notes, country, d_emergency_phone, bAlternate
			, d_24hr_phone, date_added, date_updated, d_infectious_phone 
		FROM #inserts as i
		INNER JOIN #legacyIDs AS l ON i.legacyID = l.legacyID		
		INNER JOIN dbo.vw_transitionOrganizations AS o ON i.org_id = o.organizationsID
			AND o.transitionSystemsID = @systemID;
			
		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'INSERT failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records inserted.';
			RETURN 16;
		END
			
		INSERT INTO dbo.transitionIdentities (
			id, transitionSystemsID, convertedTableID, legacyID )
		SELECT newOrgLocationsID, @systemID, @tableID, LegacyID
		FROM #legacyIDs; 
	END
	
	IF @operation = 'UPDATE'
	BEGIN 
		SELECT u.data.value('@id[1]', 'int') AS ID
			, u.data.value('@addressTypeID[1]', 'int') AS addressTypeID
			, u.data.value('@name[1]', 'nvarchar(75)') AS name
			, u.data.value('@address1[1]', 'nvarchar(200)') AS address1
			, u.data.value('@address2[1]', 'nvarchar(200)') AS address2
			, u.data.value('@address3[1]', 'nvarchar(200)') AS address3
			, u.data.value('@city[1]', 'nvarchar(50)') AS city
			, u.data.value('@state[1]', 'nvarchar(50)') AS state
			, u.data.value('@zip[1]', 'nvarchar(10)') AS zip
			, u.data.value('@d_phone[1]', 'nvarchar(25)') AS d_phone
			, u.data.value('@d_fax[1]', 'nvarchar(25)') AS d_fax
			, u.data.value('@org_id[1]', 'int') AS org_id
			, u.data.value('@active[1]', 'bit') AS active
			, u.data.value('@notes[1]', 'nvarchar(500)') AS notes
			, u.data.value('@country[1]', 'nvarchar(20)') AS country
			, u.data.value('@d_emergency_phone[1]', 'nvarchar(25)') AS d_emergency_phone
			, u.data.value('@d_24hr_phone[1]', 'nvarchar(25)') AS d_24hr_phone
			, u.data.value('@date_added[1]', 'datetime2') AS date_added
			, u.data.value('@date_updated[1]', 'datetime2') AS date_updated
			, u.data.value('@d_infectious_phone[1]', 'nvarchar(25)') AS d_infectious_phone
			, u.data.value('@bAlternate[1]', 'bit')	AS bAlternate				
		into #updates
		FROM @dataXML.nodes('u/data') AS u(data);				
	
		UPDATE dbo.OrgLocations
		SET organizationsID = o.ID
			, addressTypeID = u.addressTypeID
			, name = u.name
			, address1 = u.address1
			, address2 = u.address2
			, address3 = u.address3
			, city = u.city
			, state = u.state
			, zip = u.zip
			, d_phone = u.d_phone
			, d_fax = u.d_fax
			, active = u.active
			, notes = u.notes
			, country = u.country
			, d_emergency_phone = u.d_emergency_phone
			, d_24hr_phone = u.d_24hr_phone
			, date_updated = u.date_updated
			, d_infectious_phone = u.d_infectious_phone
			, isAlternate = u.bAlternate
		FROM #updates AS u
		INNER JOIN dbo.vw_transitionOrgLocations AS l ON u.id = l.orgLocationsID 
			AND l.transitionSystemsID = @systemID
		INNER JOIN dbo.OrgLocations AS ol ON ol.id = l.id 
			AND l.transitionSystemsID = @systemID		
		INNER JOIN dbo.vw_transitionOrganizations AS o ON u.org_id = o.OrganizationsID 
			AND o.transitionSystemsID = @systemID;
			
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
		
		DELETE FROM dbo.vw_transitionOrgLocations
		WHERE EXISTS (
			SELECT * FROM #deletes AS d
			WHERE d.id = dbo.vw_transitionOrgLocations.orgLocationsID AND
				transitionSystemsID = @systemID ); 
				
		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'DELETE failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records DELETED.';
			RETURN 16;
		END							
		
		DELETE FROM dbo.OrgLocations
		WHERE NOT EXISTS (
			SELECT * FROM dbo.transitionIdentities
			WHERE OrgLocations.id = dbo.transitionIdentities.id );
		
	END
		
END
