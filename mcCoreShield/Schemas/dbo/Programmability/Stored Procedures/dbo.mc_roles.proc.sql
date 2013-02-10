CREATE PROCEDURE [dbo].[mc_roles] (
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
			newRolesID uniqueidentifier DEFAULT NEWSEQUENTIALID(), 
			legacyID int );
		
		SET @newLegacyID = ( 
			SELECT MAX(RolesID)
			FROM dbo.vw_transitionRoles );
			
		INSERT INTO #legacyIDs ( legacyID )
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') )
		FROM @dataXML.nodes('i/data') AS i(data);
	
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER ( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') ) as legacyID
			, i.data.value('@RoleTitle[1]', 'nvarchar(50)') AS RoleTitle
			, i.data.value('@Active[1]', 'bit') AS Active
			, i.data.value('@parentid[1]', 'int') AS parentid
			, i.data.value('@id[1]', 'int') AS id
			, i.data.value('@category_id[1]', 'int') AS category_id
			, i.data.value('@statepage_include[1]', 'bit') AS statepage_include		
		into #inserts
		FROM @dataXML.nodes('i/data') AS i(data);	
		
		INSERT INTO dbo.Roles (
			id, RoleTitle, isActive, parentRolesID, statepage_include )
		SELECT 
			l.newRolesID, RoleTitle, Active, r.id,  statepage_include
		FROM #inserts as i
		INNER JOIN #legacyIDs AS l ON i.legacyID = l.legacyID
		LEFT OUTER JOIN dbo.vw_transitionRoles AS r ON r.RolesID = i.parentID
			AND r.transitionSystemsID = @systemID;

		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'INSERT failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records inserted.';
			RETURN 16;
		END
				
		INSERT INTO dbo.transitionIdentities (
			id, transitionSystemsID, convertedTableID, legacyID )
		SELECT newRolesID, @systemID, @tableID, legacyID
		FROM #legacyIDs; 
		
	end

	IF @operation = 'UPDATE'
	BEGIN 
		SELECT u.data.value('@RoleTitle[1]', 'nvarchar(50)') AS RoleTitle
			, u.data.value('@Active[1]', 'bit') AS Active
			, u.data.value('@parentid[1]', 'int') AS parentid
			, u.data.value('@id[1]', 'int') AS id
			, u.data.value('@category_id[1]', 'int') AS category_id
			, u.data.value('@statepage_include[1]', 'bit') AS statepage_include		
		INTO #updates
		FROM @dataXML.nodes('u/data') AS u(data);				
	
		UPDATE dbo.Roles SET 
			RoleTitle = u.RoleTitle
			, isActive = u.Active
			, parentRolesID = COALESCE( tr2.ID, 0 )
			, statepage_include = u.statepage_include
		FROM dbo.Roles as r
		INNER JOIN dbo.vw_transitionRoles AS tr1 ON tr1.id = r.id 
			AND	tr1.transitionSystemsID = @systemID
		INNER JOIN #updates AS u ON u.id = tr1.RolesID
		LEFT OUTER JOIN dbo.vw_transitionRoles AS tr2 ON tr2.RolesID = u.parentid
			AND	tr2.transitionSystemsID = @systemID
					
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
		
		DELETE FROM dbo.vw_transitionRoles
		WHERE EXISTS (
			SELECT * FROM #deletes AS d
			WHERE d.id = dbo.vw_transitionRoles.RolesID AND
				transitionSystemsID = @systemID ); 
		
		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'DELETE failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records DELETED.';
			RETURN 16;
		END				
				
		DELETE FROM dbo.Roles
		WHERE NOT EXISTS (
			SELECT * FROM dbo.transitionIdentities
			WHERE Roles.id = dbo.transitionIdentities.id );
		
	END
		
END
