CREATE PROCEDURE [dbo].[convertOrgLocations] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50) 
	, @dbname AS NVARCHAR(50) 
	, @tableName AS NVARCHAR (50) )	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql AS NVARCHAR(4000);

	INSERT INTO dbo.OrgLocations ( 
		id, organizationsID, name
		, address1, address2, address3
		, city, state, zip
		, d_phone, d_fax, active
		, notes, country, d_emergency_phone
		, d_24hr_phone, date_added, date_updated, d_infectious_phone, isAlternate ) 
	SELECT t.id, o.id, name
		, address1, address2, address3
		, city, state, zip
		, d_phone, d_fax, active
		, notes, country, d_emergency_phone
		, d_24hr_phone, date_added, date_updated, d_infectious_phone, bAlternate
	FROM dbo.mc_org_locationSYN AS l
	INNER JOIN dbo.tempLegacyIDs AS t on t.legacyID = l.id
	INNER JOIN dbo.vw_transitionOrganizations AS o ON o.organizationsID = l.org_id 
		AND o.transitionSystemsID = @systemID
	ORDER BY l.org_id;
	
	INSERT INTO dbo.transitionIdentities
	SELECT * FROM dbo.tempLegacyIDs;
	
	SET @sql = N'DROP TABLE ' + @dbname + '.dbo.mc_org_location' ;
	EXECUTE sp_executesql @sql;

	SET @sql = N'
		USE [' + @dbname + '] ; 
		EXEC ( ''
		CREATE VIEW dbo.mc_org_location AS
			SELECT t.orgLocationsID AS id, name, address1
				, address2, address3, city
				, state, zip, d_phone
				, d_fax, o.organizationsID AS org_id, active
				, notes, country, d_emergency_phone
				, d_24hr_phone, date_added, date_updated, d_infectious_phone, isAlternate as bAlternate 
			FROM dbo.OrgLocations AS l
			INNER JOIN dbo.vw_transitionOrgLocations AS t ON t.id = l.id 
				AND t.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			INNER JOIN dbo.vw_transitionOrganizations AS o ON o.id = l.organizationsID 
				AND o.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) '' ) ';
		
	EXECUTE sp_executesql @sql;

END
