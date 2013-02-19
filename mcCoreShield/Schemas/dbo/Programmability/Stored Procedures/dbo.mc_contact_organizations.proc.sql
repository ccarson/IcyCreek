CREATE PROCEDURE [dbo].[mc_contact_organizations] (
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
			newContactOrganizationsID uniqueidentifier DEFAULT NEWSEQUENTIALID(), 
			legacyID int );
		
		SET @newLegacyID = ( 
			SELECT coalesce(  MAX(contactOrganizationsID), 0 )
			FROM dbo.vw_transitionContactOrganizations );
			
		INSERT INTO #legacyIDs ( legacyID )
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') )
		FROM @dataXML.nodes('i/data') AS i(data);
	
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER ( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') ) as legacyID
			, i.data.value('@user_id[1]', 'int') AS user_id
			, i.data.value('@org_id[1]', 'int') AS org_id
			, i.data.value('@org_dept_id[1]', 'int') AS org_dept_id
			, i.data.value('@defaultorg[1]', 'bit') AS defaultorg
			, i.data.value('@chosenorg[1]', 'bit') AS chosenorg
			, i.data.value('@location_id[1]', 'int') AS location_id
			, i.data.value('@emergency_contact[1]', 'bit') AS emergency_contact
			, i.data.value('@date_added[1]', 'datetime2') AS date_added
			, i.data.value('@date_updated[1]', 'datetime2') AS date_updated				
		into #inserts
		FROM @dataXML.nodes('i/data') AS i(data);	
		
		INSERT INTO dbo.ContactOrganizations (
			id, ContactsID, organizationsID
			, orgDepartmentsID, orgLocationsID
			, isDefault, isChosen, isEmergencyContact
			, dateAdded, dateUpdated ) 
		SELECT 
			l.newContactOrganizationsID, c.id, o.id
			, d.id, loc.id
			, defaultorg, chosenorg, emergency_contact
			, date_added, date_updated
		FROM #inserts AS i
		INNER JOIN #legacyIDs AS l ON i.legacyID = l.legacyID		
		INNER JOIN dbo.vw_transitionContacts AS c ON i.user_id = c.contactsID 
			AND	c.transitionSystemsID = @systemID
		INNER JOIN dbo.vw_transitionOrganizations AS o ON i.org_id = o.organizationsID 
			AND	o.transitionSystemsID = @systemID
		LEFT JOIN dbo.vw_transitionOrgLocations AS loc ON i.location_id = loc.orgLocationsID 
			AND	loc.transitionSystemsID = @systemID
		LEFT OUTER JOIN dbo.vw_transitionOrgDepartments d ON i.org_dept_id = d.orgDepartmentsID 
			AND	d.transitionSystemsID = @systemID;

		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'INSERT failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records inserted.';
			RETURN 16;
		END
			
		INSERT INTO dbo.transitionIdentities (
			id, transitionSystemsID, convertedTableID, legacyID )
		SELECT newContactOrganizationsID, @systemID, @tableID, legacyID
		FROM #legacyIDs; 
	end

	IF @operation = 'UPDATE'
	BEGIN 
		SELECT u.data.value('@id[1]', 'int') AS id
			, u.data.value('@user_id[1]', 'int') AS user_id
			, u.data.value('@org_id[1]', 'int') AS org_id
			, u.data.value('@org_dept_id[1]', 'int') AS org_dept_id
			, u.data.value('@defaultorg[1]', 'bit') AS defaultorg
			, u.data.value('@chosenorg[1]', 'bit') AS chosenorg
			, u.data.value('@location_id[1]', 'int') AS location_id
			, u.data.value('@emergency_contact[1]', 'bit') AS emergency_contact
			, u.data.value('@date_added[1]', 'datetime2') AS date_added
			, u.data.value('@date_updated[1]', 'datetime2') AS date_updated	
		INTO #updates
		FROM @dataXML.nodes('u/data') AS u(data);				
	
		UPDATE dbo.ContactOrganizations
		SET contactsID = c.id
			, organizationsID = o.id
			, orgDepartmentsID = d.id
			, orgLocationsID = l.id
			, isDefault = u.defaultorg
			, isChosen = u.chosenorg
			, isEmergencyContact = u.emergency_contact
			, dateUpdated = u.date_updated
		FROM #updates AS u
		INNER JOIN dbo.vw_transitionContactOrganizations AS tco ON u.id = tco.contactOrganizationsID 
			AND tco.transitionSystemsID = @systemID
		INNER JOIN dbo.ContactOrganizations AS co ON tco.id = co.id
			AND tco.transitionSystemsID = @systemID
		INNER JOIN dbo.vw_transitionContacts AS c ON u.user_id = c.contactsID 
			AND c.transitionSystemsID = @systemID
		INNER JOIN dbo.vw_transitionOrganizations AS o ON u.org_id = o.organizationsID 
			AND o.transitionSystemsID = @systemID
		LEFT JOIN dbo.vw_transitionOrgLocations AS l ON u.location_id = l.orgLocationsID 
			AND l.transitionSystemsID = @systemID
		LEFT OUTER JOIN dbo.vw_transitionOrgDepartments d ON u.org_dept_id = d.orgDepartmentsID 
			AND d.transitionSystemsID = @systemID;			

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
		
		DELETE FROM dbo.vw_transitionContactOrganizations
		WHERE EXISTS (
			SELECT * FROM #deletes AS d
			WHERE d.id = dbo.vw_transitionContactOrganizations.ContactOrganizationsID AND
				transitionSystemsID = @systemID ); 
				
		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'DELETE failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records DELETED.';
			RETURN 16;
		END							
		
		DELETE FROM dbo.ContactOrganizations
		WHERE NOT EXISTS (
			SELECT * FROM dbo.transitionIdentities
			WHERE ContactOrganizations.id = dbo.transitionIdentities.id );
		
	END
		
END
