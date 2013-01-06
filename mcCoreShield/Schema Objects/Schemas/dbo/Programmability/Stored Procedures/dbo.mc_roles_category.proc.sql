CREATE PROCEDURE [dbo].[mc_roles_category] (
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
			newRoleCategoriesID uniqueidentifier DEFAULT NEWSEQUENTIALID(), 
			legacyID int );
		
		SET @newLegacyID = ( 
			SELECT MAX(RoleCategoriesID)
			FROM dbo.vw_transitionRoleCategories );
			
		INSERT INTO #legacyIDs ( legacyID )
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') )
		FROM @dataXML.nodes('i/data') AS i(data);
	
		SELECT @newLegacyID + 
			ROW_NUMBER() OVER ( ORDER BY i.data.value('@rowID[1]', 'nvarchar(50)') ) as legacyID
			, i.data.value('@id[1]', 'int') AS id
			, i.data.value('@category_name[1]', 'varchar(50)') AS category_name			
		into #inserts
		FROM @dataXML.nodes('i/data') AS i(data);	
		
		INSERT INTO dbo.RoleCategories (
			id, name )
		SELECT 
			l.newRoleCategoriesID, category_name
		FROM #inserts as i
		INNER JOIN #legacyIDs AS l ON i.legacyID = l.legacyID;

		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'INSERT failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records inserted.';
			RETURN 16;
		END
				
		INSERT INTO dbo.transitionIdentities (
			id, transitionSystemsID, convertedTableID, legacyID )
		SELECT newRoleCategoriesID, @systemID, @tableID, legacyID
		FROM #legacyIDs; 
		
	end

	IF @operation = 'UPDATE'
	BEGIN 
		SELECT u.data.value('@id[1]', 'int') AS id
			, u.data.value('@category_name[1]', 'varchar(50)') AS category_name		
		INTO #updates
		FROM @dataXML.nodes('u/data') AS u(data);				
	
		UPDATE dbo.RoleCategories SET 
			name = u.category_name
		FROM dbo.RoleCategories as rc
		INNER JOIN dbo.vw_transitionRoleCategories AS t ON t.id = rc.id 
			AND	t.transitionSystemsID = @systemID
		INNER JOIN #updates AS u ON u.id = t.RoleCategoriesID;
					
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
		
		DELETE FROM dbo.vw_transitionRoleCategories
		WHERE EXISTS (
			SELECT * FROM #deletes AS d
			WHERE d.id = dbo.vw_transitionRoleCategories.RoleCategoriesID AND
				transitionSystemsID = @systemID ); 
		
		IF @@ROWCOUNT <> @recordsIN
		BEGIN
			SET @errorMessage = N'DELETE failed! ' + 
									CAST( @recordsIN AS NVARCHAR(10) ) + N' records in, ' + 
									CAST( @@ROWCOUNT AS NVARCHAR(10) ) + N' records DELETED.';
			RETURN 16;
		END				
				
		DELETE FROM dbo.RoleCategories
		WHERE NOT EXISTS (
			SELECT * FROM dbo.transitionIdentities
			WHERE RoleCategories.id = dbo.transitionIdentities.id );
		
	END
		
END
