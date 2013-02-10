CREATE PROCEDURE [dbo].[convertOrganizations] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50) 
	, @dbname AS NVARCHAR(50) 
	, @tableName AS NVARCHAR (50) )	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql AS NVARCHAR(4000);
	
	INSERT INTO dbo.Organizations (
		id, Name, Website
		, Status, Summary, type_id
		, vertical_id, active, date_Added
		, added_by, date_updated, updated_by
		, is_demo, temp )
	SELECT t.id AS id, Name, Website
		, Status, Summary, type_id
		, vertical_id, active, date_Added
		, tc1.id, date_updated, tc2.id
		, is_demo, temp
	FROM dbo.mc_organizationSYN AS o
	INNER JOIN dbo.tempLegacyIDs AS t ON t.legacyID = o.id
	LEFT OUTER JOIN dbo.vw_transitionContacts AS tc1 ON tc1.contactsID = o.added_by 
		AND tc1.transitionSystemsID = @systemID
	LEFT OUTER JOIN dbo.vw_transitionContacts AS tc2 ON tc2.contactsID = o.updated_by 
		AND tc2.transitionSystemsID = @systemID;
	
	INSERT INTO dbo.transitionIdentities 
	SELECT * FROM dbo.tempLegacyIDs;
	
/*	create view for organizations on legacy database */	

	SET @sql = N'DROP TABLE ' + @dbname + '.dbo.mc_organization ' ;
	EXECUTE sp_executesql @sql;	
	
	SET @sql = N'
		USE [' + @dbname + '] ; 
		EXEC ( ''
		CREATE VIEW dbo.mc_organization AS
			SELECT t.organizationsID AS id, Name, Website
				, Status, Summary, type_id
				, vertical_id, active, date_added
				, COALESCE( tc1.contactsID, 0 ) AS added_by, date_updated
				, COALESCE( tc2.contactsID, 0 ) AS updated_by, is_demo, temp
			FROM dbo.Organizations AS o
			INNER JOIN dbo.vw_transitionOrganizations AS t ON t.id = o.id 
				AND t.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' )
			LEFT OUTER JOIN dbo.vw_transitionContacts AS tc1 ON tc1.id = o.added_by
				AND tc1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' )
			LEFT OUTER JOIN dbo.vw_transitionContacts AS tc2 ON tc2.id = o.updated_by 
				AND tc2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) '' ) ';

	EXECUTE sp_executesql @sql;
	
END
