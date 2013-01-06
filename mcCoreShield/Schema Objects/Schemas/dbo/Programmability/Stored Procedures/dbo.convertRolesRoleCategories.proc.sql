CREATE PROCEDURE [dbo].[convertRolesRoleCategories] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50) 
	, @dbname AS NVARCHAR(50) 
	, @tableName AS NVARCHAR (50) )	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql AS NVARCHAR(4000);
	
/* load new RoleCategories table */	
	INSERT INTO dbo.RolesRoleCategories (
		id, roleCategoriesID, rolesID )
	SELECT t.id, tc.id, tr.id
	FROM dbo.mc_roles_relationSYN AS rr
	INNER JOIN dbo.tempLegacyIDs AS t ON t.legacyID = rr.id 
	INNER JOIN dbo.vw_transitionRoleCategories AS tc ON tc.RoleCategoriesID = rr.category_id
		AND tc.transitionSystemsID = @systemID
	INNER JOIN dbo.vw_transitionRoles AS tr ON tr.RolesID = rr.role_id
		AND tr.transitionSystemsID = @systemID
	
	INSERT INTO dbo.transitionIdentities 
	SELECT * FROM dbo.tempLegacyIDs;

/*	
	drop legacy table
	create view to replace legacy table 
*/	
	SET @sql = N'DROP TABLE ' + @dbname + '.dbo.mc_roles_relation' ;
	EXECUTE sp_executesql @sql;

	SET @sql = N'
		USE ' + QUOTENAME(@dbname, '[]') + N'; 
		EXEC ( ''
		CREATE VIEW dbo.mc_roles_relation AS
			SELECT trc.RolesRoleCategoriesID AS id, tr.RolesID as role_id, tc.RoleCategoriesID as category_id
			FROM dbo.RolesRoleCategories AS rrc
			INNER JOIN dbo.vw_transitionRolesRoleCategories AS trc ON trc.id = rrc.id
				AND trc.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			INNER JOIN dbo.vw_transitionRoles AS tr ON tr.id = rrc.RolesID
				AND tr.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			INNER JOIN dbo.vw_transitionRoleCategories AS tc ON tc.id = rrc.RoleCategoriesID 
				AND tc.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) '' ) ';
					
	EXECUTE sp_executesql @sql;

END
