CREATE PROCEDURE [dbo].[convertRoles] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50) 
	, @dbname AS NVARCHAR(50) 
	, @tableName AS NVARCHAR (50) )	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql AS NVARCHAR(4000);
	
/* load new Roles table */	
	INSERT INTO dbo.Roles (
		id, RoleTitle, isActive
		, parentRolesID, statepage_include )
	SELECT t1.id, r.RoleTitle, r.Active
		, t2.id, statepage_include
	FROM dbo.mc_rolesSYN AS r
	INNER JOIN dbo.tempLegacyIDs AS t1 ON t1.legacyID = r.id 
	LEFT OUTER JOIN dbo.tempLegacyIDs AS t2 ON t2.legacyID = r.parentid
	
	INSERT INTO dbo.transitionIdentities 
	SELECT * FROM dbo.tempLegacyIDs;

/*	
	drop legacy table
	create view to replace legacy table 
*/	
	SET @sql = N'DROP TABLE ' + @dbname + '.dbo.mc_roles' ;
	EXECUTE sp_executesql @sql;

	SET @sql = N'
		USE ' + QUOTENAME(@dbname, '[]') + N'; 
		EXEC ( ''
		CREATE VIEW dbo.mc_roles AS
			SELECT r.RoleTitle, r.isActive AS Active, COALESCE( t2.RolesID, 0 ) AS parentid
				, t1.RolesID AS id, 0 AS category_id, r.statepage_include
			FROM dbo.Roles AS r
			INNER JOIN dbo.vw_transitionRoles AS t1 ON t1.id = r.id 
				AND t1.transitionSystemsID  = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			LEFT OUTER JOIN dbo.vw_transitionRoles AS t2 ON t2.id = r.parentRolesID
				AND t2.transitionSystemsID  = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) '' ) ';
					
	EXECUTE sp_executesql @sql;

END
