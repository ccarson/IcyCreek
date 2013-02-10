CREATE PROCEDURE [dbo].[createTargetSynonyms] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50)
	, @dbname AS NVARCHAR(50) )	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql AS NVARCHAR(4000);
	DECLARE @tableName AS NVARCHAR(50);
	DECLARE @viewName AS NVARCHAR(75);
	/* Create synonyms for mcCoreShield tables on target database */

 	DECLARE tablenames CURSOR FOR
		SELECT newTableName FROM dbo.coreConvertedTables
		WHERE isReady = 1;
	
 	OPEN tablenames;
	
 	FETCH NEXT FROM tablenames INTO @tableName;

 	WHILE @@FETCH_STATUS = 0
 	BEGIN	
 		SET @viewName = N'dbo.vw_transition' + @tableName;	
 		SET @sql = N'
 			USE [' + @dbname + N'] ; 
 			IF EXISTS ( SELECT * FROM sys.synonyms WHERE name = N''' + @tableName + N''' ) 
				DROP SYNONYM dbo.' + @tableName + N'; 
 			USE [' + @dbname + N'] ; 
 			CREATE SYNONYM dbo.' + @tableName + N' FOR mcCoreShield.dbo.' + @tableName + N';
 			CREATE SYNONYM ' + @viewName + N' FOR mcCoreShield.' + @viewName + N';'
 		EXECUTE sp_executesql @sql;
 		FETCH NEXT FROM tablenames INTO @tableName;
 	END
 	
 	SET @sql = N'
 		USE [' + @dbname + N'] ; 
 		IF EXISTS ( SELECT * FROM sys.synonyms WHERE name = N''transitionSystems'' ) 
			DROP SYNONYM dbo.transitionSystems ; 
		USE [' + @dbname + N'] ; 
 			CREATE SYNONYM dbo.transitionSystems FOR mcCoreShield.dbo.transitionSystems ; '
 	EXECUTE sp_executesql @sql;
 	
 	IF @dbname = 'mcfern' OR @dbName = 'mcNahln'
 	BEGIN
 	 SET @sql = N'
 		USE [' + @dbname + N'] ; 
 		IF EXISTS ( SELECT * FROM sys.synonyms WHERE name = N''OrgDepartmentLab'' ) 
			DROP SYNONYM dbo.OrgDepartmentLab ; 
		USE [' + @dbname + N'] ; 
 			CREATE SYNONYM dbo.OrgDepartmentLab FOR mcCoreShield.dbo.OrgDepartmentLab ; '
 	EXECUTE sp_executesql @sql;
 	
 	END
	
 	CLOSE tablenames;
 	DEALLOCATE tablenames;

 	DECLARE tablenames CURSOR FOR
		SELECT tableName FROM dbo.coreConvertedTables
		WHERE isReady = 1;
	
 	OPEN tablenames;
	
 	FETCH NEXT FROM tablenames INTO @tableName;

 	WHILE @@FETCH_STATUS = 0
 	BEGIN		

 		SET @sql = N'
 			IF EXISTS ( SELECT * FROM sys.synonyms WHERE name = N''' + @tableName + N'SYN'' ) 
						DROP SYNONYM dbo.' + @tableName + N'SYN ;
			CREATE SYNONYM dbo.' + @tableName + N'SYN FOR ' + @dbname + '.dbo.' + @tableName + N';'
		EXECUTE sp_executesql @sql;

 		FETCH NEXT FROM tablenames INTO @tableName;
 	END
	
 	CLOSE tablenames;
 	DEALLOCATE tablenames;

	
END