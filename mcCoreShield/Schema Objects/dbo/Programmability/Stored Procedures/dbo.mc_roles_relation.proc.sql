CREATE PROCEDURE [dbo].[mc_roles_relation] (
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
			newRolesRoleCategoriesID uniqueidentifier DEFAULT NEWSEQUENTIALID(), 
			legacyID int );
		
		SET @newLegacyID = ( 
			SELECT MAX(RolesRoleCategoriesID)
			FROM dbo.vw_transitionRolesRoleCategories );
			
		INSERT INTO #legacyIDs ( legacyID )
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') )
		FROM @dataXML.nodes('i/data') AS i(data);
	
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER ( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') ) as legacyID
			, i.data.value('@id[1]', 'int') AS id
			, i.data.value('@role_id[1]', 'int') AS role_id
			, i.data.value('@category_id[1]', 'int') AS category_id		
		INTO #inserts
		FROM @dataXML.nodes('i/data') AS i(data);	
		
		INSERT INTO dbo.RolesRoleCategories (
			id, RolesID, RoleCategoriesID )
		SELECT 
			l.newRolesRoleCategoriesID, r.id, rc.id 
		FROM #inserts as i
		INNER JOIN #legacyIDs AS l ON i.legacyID = l.legacyID
		INNER JOIN dbo.vw_transitionRoles AS r ON r.RolesID = i.role_id
			AND r.transitionSystemsID = @systemID
		INNER JOIN dbo.vw_transitionRoleCategories AS rc ON rc.RoleCategoriesID = i.category_id
			AND rc.transitionSystemsID = @systemID;

		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'INSERT failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records inserted.';
			RETURN 16;
		END
				
		INSERT INTO dbo.transitionIdentities (
			id, transitionSystemsID, convertedTableID, legacyID )
		SELECT newRolesRoleCategoriesID, @systemID, @tableID, legacyID
		FROM #legacyIDs; 
		
	end

	IF @operation = 'UPDATE'
	BEGIN 
		SELECT u.data.value('@id[1]', 'int') AS id
			, u.data.value('@role_id[1]', 'int') AS role_id
			, u.data.value('@category_id[1]', 'int') AS category_id		
		INTO #updates
		FROM @dataXML.nodes('u/data') AS u(data);				
	
		UPDATE dbo.RolesRoleCategories SET 
			RolesID = r.id
			, RoleCategoriesID = rc.id
		FROM dbo.RolesRoleCategories as rrc
		INNER JOIN dbo.vw_transitionRolesRoleCategories AS t ON t.id = rrc.id 
			AND	t.transitionSystemsID = @systemID
		INNER JOIN #updates AS u ON u.id = t.RolesRoleCategoriesID
		INNER JOIN dbo.vw_transitionRoles AS r ON r.RolesID = u.role_id
			AND r.transitionSystemsID = @systemID
		INNER JOIN dbo.vw_transitionRoleCategories AS rc ON rc.RoleCategoriesID = u.category_id
			AND rc.transitionSystemsID = @systemID;
					
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
		
		DELETE FROM dbo.vw_transitionRolesRoleCategories
		WHERE EXISTS (
			SELECT * FROM #deletes AS d
			WHERE d.id = dbo.vw_transitionRolesRoleCategories.RolesRoleCategoriesID AND
				transitionSystemsID = @systemID ); 
		
		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'DELETE failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records DELETED.';
			RETURN 16;
		END				
				
		DELETE FROM dbo.RolesRoleCategories
		WHERE NOT EXISTS (
			SELECT * FROM dbo.transitionIdentities
			WHERE RolesRoleCategories.id = dbo.transitionIdentities.id );
		
	END
		
END
