CREATE PROCEDURE [dbo].[convertRoleCategories] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50) 
	, @dbname AS NVARCHAR(50) 
	, @tableName AS NVARCHAR (50) )	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql AS NVARCHAR(4000);
	
/* load new RoleCategories table */	
	INSERT INTO dbo.RoleCategories (
		id, name )
	SELECT t.id, c.category_name
	FROM dbo.mc_roles_categorySYN AS c
	INNER JOIN dbo.tempLegacyIDs AS t ON t.legacyID = c.id 
	
	INSERT INTO dbo.transitionIdentities 
	SELECT * FROM dbo.tempLegacyIDs;

/*	
	drop legacy table
	create view to replace legacy table 
*/	
	SET @sql = N'DROP TABLE ' + @dbname + '.dbo.mc_roles_category' ;
	EXECUTE sp_executesql @sql;

	SET @sql = N'
		USE ' + QUOTENAME(@dbname, '[]') + N'; 
		EXEC ( ''
		CREATE VIEW dbo.mc_roles_category AS
			SELECT t.RoleCategoriesID AS id, name AS category_name
			FROM dbo.RoleCategories AS c
			INNER JOIN dbo.vw_transitionRoleCategories AS t ON t.id = c.id 
				AND t.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) '' ) ';
					
	EXECUTE sp_executesql @sql;

END
