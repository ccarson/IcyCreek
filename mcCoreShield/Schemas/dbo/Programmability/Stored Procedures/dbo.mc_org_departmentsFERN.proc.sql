CREATE PROCEDURE [dbo].[mc_org_departmentsFERN] (
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
			newOrgDepartmentsID uniqueidentifier DEFAULT NEWSEQUENTIALID(), 
			legacyID int );
		
		SET @newLegacyID = ( 
			SELECT coalesce(MAX(OrgDepartmentsID), 0) 
			FROM dbo.vw_transitionOrgDepartments );
			
		INSERT INTO #legacyIDs ( legacyID )
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') )
		FROM @dataXML.nodes('i/data') AS i(data);
	
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER ( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') ) as legacyID
					, i.data.value('@name[1]', 'nvarchar(100)') AS name
					, i.data.value('@org_id[1]', 'int') AS org_id
					, i.data.value('@location_id[1]', 'int') AS location_id
					, i.data.value('@parent_dept_id[1]', 'int') AS parent_dept_id
					, i.data.value('@active[1]', 'bit') AS active
					, i.data.value('@notes[1]', 'nvarchar(500)') AS notes
					, i.data.value('@website[1]', 'nvarchar(500)') AS website
					, i.data.value('@date_added[1]', 'datetime2') AS date_added
					, i.data.value('@added_by[1]', 'int') AS added_by
					, i.data.value('@date_updated[1]', 'datetime2') AS date_updated
					, i.data.value('@updated_by[1]', 'int') AS updated_by
					, i.data.value('@org_level[1]', 'int') AS org_level	
					, i.data.value('@fern_Active[1]', 'bit') AS fern_active
					, i.data.value('@micro[1]', 'bit') AS micro
					, i.data.value('@chem[1]', 'bit') AS chem
					, i.data.value('@rad[1]', 'bit') AS rad
					, i.data.value('@is_searchable[1]', 'bit') AS is_searchable
					, i.data.value('@micro_date_accept[1]', 'datetime2') AS micro_date_accept
					, i.data.value('@micro_date_withdraw[1]', 'datetime2') AS micro_date_withdraw
					, i.data.value('@chem_date_accept[1]', 'datetime2') AS chem_date_accept
					, i.data.value('@chem_date_withdraw[1]', 'datetime2') AS chem_date_withdraw
					, i.data.value('@rad_date_accept[1]', 'datetime2') AS rad_date_accept
					, i.data.value('@rad_date_withdraw[1]', 'datetime2') AS rad_date_withdraw
		into #inserts
		FROM @dataXML.nodes('i/data') AS i(data);	
		
		INSERT INTO dbo.OrgDepartments (
			id, name, organizationsID
			, orgLocationsID, parentDepartmentsID, org_level
			, active, notes, website
			, date_added, added_by, date_updated, updated_by )
		SELECT 
			l.newOrgDepartmentsID, name, o.id
			, ol.id, d.id, org_level
			, active, notes, website
			, date_added, tc.id, date_updated, tc2.id
		FROM #inserts
		INNER JOIN #legacyIDs AS l ON #inserts.legacyID = l.legacyID
		INNER JOIN dbo.vw_transitionOrganizations AS o ON #inserts.org_id = o.organizationsID AND 
			o.transitionSystemsID = @systemID
		INNER JOIN dbo.vw_transitionOrgLocations AS ol ON #inserts.location_id = ol.orgLocationsID AND 
			ol.transitionSystemsID = @systemID
		LEFT JOIN dbo.vw_transitionOrgDepartments AS d ON #inserts.parent_dept_id = d.OrgDepartmentsID AND
			d.transitionSystemsID = @SystemID
		LEFT JOIN dbo.vw_transitionContacts AS tc on #inserts.added_by = tc.ContactsID AND
			tc.transitionSystemsID = @SystemID
		LEFT JOIN dbo.vw_transitionContacts AS tc2 on #inserts.updated_by = tc2.ContactsID AND
			tc2.transitionSystemsID = @SystemID ;
			

		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'INSERT failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records inserted.';
			RETURN 16;
		END
					
		
		INSERT INTO dbo.OrgDepartmentLab ( 
			id, fernActive, micro, chem, rad, isSearchable
			, microAcceptedOn, microWithdrawOn, chemAcceptedOn
			, chemWithdrawOn, radAcceptedOn, radWithdrawOn )
		SELECT
			l.newOrgDepartmentsID, fern_active, micro, chem, rad, is_searchable
			, micro_date_accept, micro_date_withdraw, chem_date_accept
			, chem_date_withdraw, rad_date_accept, rad_date_withdraw 
		FROM #inserts
		INNER JOIN #legacyIDs AS l ON #inserts.legacyID = l.legacyID ; 	


		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'INSERT failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records inserted.';
			RETURN 16;
		END
		
		INSERT INTO dbo.transitionIdentities (
			id, transitionSystemsID, convertedTableID, legacyID )
		SELECT newOrgDepartmentsID, @systemID, @tableID, legacyID
		FROM #legacyIDs; 
	end

	IF @operation = 'UPDATE'
	BEGIN 
		SELECT u.data.value('@id[1]', 'int') AS id
			, u.data.value('@name[1]', 'nvarchar(100)') AS name
			, u.data.value('@org_id[1]', 'int') AS org_id
			, u.data.value('@location_id[1]', 'int') AS location_id
			, u.data.value('@parent_dept_id[1]', 'int') AS parent_dept_id
			, u.data.value('@active[1]', 'bit') AS active
			, u.data.value('@notes[1]', 'nvarchar(500)') AS notes
			, u.data.value('@website[1]', 'nvarchar(500)') AS website
			, u.data.value('@date_added[1]', 'datetime2') AS date_added
			, u.data.value('@added_by[1]', 'int') AS added_by
			, u.data.value('@date_updated[1]', 'datetime2') AS date_updated
			, u.data.value('@updated_by[1]', 'int') AS updated_by
			, u.data.value('@org_level[1]', 'int') AS org_level
			, u.data.value('@fern_Active[1]', 'bit') AS fern_active
			, u.data.value('@micro[1]', 'bit') AS micro
			, u.data.value('@chem[1]', 'bit') AS chem
			, u.data.value('@rad[1]', 'bit') AS rad
			, u.data.value('@is_searchable[1]', 'bit') AS is_searchable
			, u.data.value('@micro_date_accept[1]', 'datetime2') AS micro_date_accept
			, u.data.value('@micro_date_withdraw[1]', 'datetime2') AS micro_date_withdraw
			, u.data.value('@chem_date_accept[1]', 'datetime2') AS chem_date_accept
			, u.data.value('@chem_date_withdraw[1]', 'datetime2') AS chem_date_withdraw
			, u.data.value('@rad_date_accept[1]', 'datetime2') AS rad_date_accept
			, u.data.value('@rad_date_withdraw[1]', 'datetime2') AS rad_date_withdraw
			
		into #updates
		FROM @dataXML.nodes('u/data') AS u(data);				
	
		UPDATE dbo.OrgDepartments
		SET name = u.name
			, organizationsID = o.id
			, orgLocationsID = l.id
			, parentDepartmentsID = d2.id
			, org_level = u.org_level
			, active = u.active
			, notes = u.notes
			, website = u.website
			, date_updated = u.date_updated
			, updated_by = c.id
		FROM #updates AS u
		INNER JOIN dbo.vw_transitionOrgDepartments AS d ON u.id = d.OrgDepartmentsID 
			AND d.transitionSystemsID = @systemID
		INNER JOIN dbo.OrgDepartments AS od on od.id = d.id	
		INNER JOIN dbo.vw_transitionOrganizations AS o ON u.org_id = o.organizationsID 
			AND o.transitionSystemsID = @systemID
		INNER JOIN dbo.vw_transitionOrgLocations AS l ON u.location_id = l.orgLocationsID 
			AND l.transitionSystemsID = @systemID
		LEFT JOIN dbo.vw_transitionContacts AS c on u.updated_by = c.ContactsID 
			AND c.transitionSystemsID = @SystemID
		LEFT JOIN dbo.vw_transitionOrgDepartments AS d2 ON u.parent_dept_id = d2.OrgDepartmentsID 
			AND d2.transitionSystemsID = @SystemID;	
			
		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'UPDATE failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records updated.';
			RETURN 16;
		END			

		UPDATE dbo.OrgDepartmentLab 
		SET fernActive		  = u.fern_active
			, micro			  = u.micro
			, chem            = u.chem
			, rad             = u.rad
			, isSearchable    = u.is_searchable
			, microAcceptedOn = u.micro_date_accept
			, microWithdrawOn = u.micro_date_withdraw
			, chemAcceptedOn  = u.chem_date_accept
			, chemWithdrawOn  = u.chem_date_withdraw
			, radAcceptedOn   = u.rad_date_accept
			, radWithdrawOn   = u.rad_date_withdraw
		FROM #updates AS u
		INNER JOIN dbo.vw_transitionOrgDepartments AS d ON u.id = d.OrgDepartmentsID 
			AND d.transitionSystemsID = @systemID
		INNER JOIN dbo.OrgDepartmentLab AS odl ON odl.id = d.id ;
			
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
		
		DELETE FROM dbo.vw_transitionOrgDepartments
		WHERE EXISTS (
			SELECT * FROM #deletes AS d
			WHERE d.id = dbo.vw_transitionOrgDepartments.orgDepartmentsID AND
				transitionSystemsID = @systemID ); 
				
		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'DELETE failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records DELETED.';
			RETURN 16;
		END	
		
		DELETE FROM dbo.OrgDepartmentLab
		WHERE NOT EXISTS (
			SELECT * FROM dbo.transitionIdentities
			WHERE OrgDepartmentLab.id = dbo.transitionIdentities.id );


		DELETE FROM dbo.OrgDepartments
		WHERE NOT EXISTS (
			SELECT * FROM dbo.transitionIdentities
			WHERE OrgDepartments.id = dbo.transitionIdentities.id );
		
	END

END
