CREATE PROCEDURE [dbo].[loadLegacyIDs] (
	@systemID AS INT
	, @tableName AS NVARCHAR (50) )	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @convertedTableID AS INT;
	DECLARE @sql AS NVARCHAR(4000);
	
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tempLegacyIDs]') AND type in (N'U'))
		DROP TABLE [dbo].[tempLegacyIDs];
		
	SET @convertedTableID = (
		SELECT id
		FROM mcCoreShield.dbo.coreConvertedTables
		WHERE tableName = @tableName );
	
	SET @sql = N'
		CREATE TABLE [dbo].[tempLegacyIDs](
			[id] [uniqueidentifier] DEFAULT NEWSEQUENTIALID()
			, [transitionSystemsID] [int] NOT NULL DEFAULT ' + CAST( @systemID AS NVARCHAR(20) ) + N'
			, [convertedTableID] [int] NOT NULL DEFAULT ' + CAST ( @convertedTableID AS NVARCHAR(20) ) + N'
			, [legacyID] [int] NOT NULL ) 
		ON [PRIMARY];';

	EXECUTE sp_executesql @sql;

	ALTER TABLE [dbo].[tempLegacyIDs] 
	ADD CONSTRAINT [PK_tempLegacyIDs] PRIMARY KEY CLUSTERED (
		legacyID ASC ) ON [PRIMARY] ;
	
	SET @sql = N'
		INSERT INTO tempLegacyIDs ( legacyID )
		SELECT id FROM dbo.' + @tableName + N'SYN 
		ORDER BY id';

	EXECUTE sp_executesql @sql;	

END
