CREATE PROCEDURE [dbo].[createTargetTriggers] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50)
	, @dbname AS NVARCHAR(50) )
AS 
BEGIN
	SET NOCOUNT ON ;

	DECLARE @sql AS NVARCHAR(4000) ;
	DECLARE @triggerName AS NVARCHAR(100) ;
	DECLARE @tableName AS NVARCHAR(100) ;
	DECLARE @tableID AS INT ;

	PRINT N'/*  BEGIN TRIGGERS  */' ;

	DECLARE tablenames CURSOR FOR 
		SELECT id, tableName
		FROM dbo.coreConvertedTables
		WHERE isReady = 1 ;

	OPEN tablenames ;

	FETCH NEXT FROM tablenames INTO @tableID, @tableName ;	

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @triggerName = N'dbo.process_' + @tableName ;
	
		SET @sql = N'
USE ' + QUOTENAME(@dbName, '[]') + N';
GO'

		SET @sql = @sql + N'
IF OBJECT_ID (' + QUOTENAME(@triggerName, '''') + N', ''TR'') IS NOT NULL
	DROP TRIGGER ' + @triggerName + N' ;
GO'

		SET @sql = @sql + N'
CREATE TRIGGER ' + @triggerName + N' ON dbo.' + @tableName + N' 
INSTEAD OF INSERT, DELETE, UPDATE AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @dataXML 			AS XML = NULL ;
	DECLARE @operation 			AS NVARCHAR(20) ;
	DECLARE @rc 				AS INT ;
	DECLARE @errorMessage 		AS NVARCHAR(250) ;
	DECLARE @recordsIN			AS INT ; 
	DECLARE @recordsInserted 	AS INT ;
	DECLARE @recordsUpdated 	AS INT ;
	DECLARE @recordsDeleted 	AS INT ;
	
	SET @recordsInserted = (
		SELECT COUNT(*) FROM inserted
		WHERE NOT EXISTS ( SELECT * FROM deleted ) ) ;

	SET @recordsUpdated = (
		SELECT COUNT(*) FROM inserted
		WHERE EXISTS ( SELECT * FROM deleted ) ) ;
		
	SET @recordsDeleted = (
		SELECT COUNT(*) FROM deleted 
		WHERE NOT EXISTS ( SELECT * FROM inserted ) ) ;
	
	IF ( @recordsInserted + @recordsUpdated + @recordsDeleted = 0 )
		RETURN ;
	
	IF @recordsInserted > 0 
	BEGIN
		SET @dataXML = ( SELECT NEWID() AS rowID, * FROM inserted AS data FOR XML AUTO, ROOT(N''i'') ) ;
		SET @operation = N''INSERT'' ;
		SET @recordsIN = @recordsInserted ;
	END

	IF @recordsUpdated > 0 	
	BEGIN
		SET @dataXML = ( SELECT * FROM inserted AS data FOR XML AUTO, ROOT(N''u'') ) ;
		SET @operation = N''UPDATE'' ; 
		SET @recordsIN = @recordsUpdated ;
	END

	IF @recordsDeleted > 0 	
	BEGIN
		SET @dataXML = ( SELECT id FROM deleted AS data FOR XML AUTO, ROOT(N''d'') ) ;
		SET @operation = N''DELETE'' ;
		SET @recordsIN = @recordsDeleted ;
	END

	EXEC @rc = [mcCoreShield].[dbo].[' + @tableName + N'] 
		@systemID = ' + CAST(@systemID AS NVARCHAR(10)) + N'
		, @tableID = ' + CAST(@tableID AS NVARCHAR(10)) + N'
		, @recordsIN = @recordsIN
		, @dataXML = @dataXML
		, @operation = @operation
		, @errorMessage = @errorMessage ;

	IF @rc <> 0
		RAISERROR (@errorMessage, 16, 0) ;
END
GO' ;

		PRINT @sql ;
		
		FETCH NEXT FROM tablenames INTO @tableID, @tableName ;
	END
	
	CLOSE tablenames ;
	DEALLOCATE tablenames ;

	PRINT N'/*  END TRIGGERS  */' ;	
	
END
