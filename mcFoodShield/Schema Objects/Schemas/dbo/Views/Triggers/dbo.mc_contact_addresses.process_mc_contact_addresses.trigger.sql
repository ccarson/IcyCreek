
CREATE TRIGGER [dbo].[process_mc_contact_addresses] ON [dbo].[mc_contact_addresses]
INSTEAD OF INSERT, UPDATE, DELETE
AS

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
	DECLARE @tableID			AS INT ; 
	DECLARE @systemID			AS INT ;
	
	SELECT  @tableID = id
	  FROM  mcCoreShield.dbo.coreConvertedTables
	 WHERE  tableName = 'mc_contact_addresses' ;
	 
	SELECT  @systemID = id
	  FROM  dbo.transitionSystems
	 WHERE  systemName = db_name() ;

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
		SET @dataXML = ( SELECT NEWID() AS rowID, * FROM inserted AS data FOR XML AUTO, ROOT(N'i') ) ;
		SET @operation = N'INSERT' ;
		SET @recordsIN = @recordsInserted ;
	END

	IF @recordsUpdated > 0 	
	BEGIN
		SET @dataXML = ( SELECT * FROM inserted AS data FOR XML AUTO, ROOT(N'u') ) ;
		SET @operation = N'UPDATE' ; 
		SET @recordsIN = @recordsUpdated ;
	END

	IF @recordsDeleted > 0 	
	BEGIN
		SET @dataXML = ( SELECT id FROM deleted AS data FOR XML AUTO, ROOT(N'd') ) ;
		SET @operation = N'DELETE' ;
		SET @recordsIN = @recordsDeleted ;
	END

	EXEC @rc = [mcCoreShield].[dbo].[mc_contact_addresses] 
		@systemID = @systemID
		, @tableID = @tableID
		, @recordsIN = @recordsIN
		, @dataXML = @dataXML
		, @operation = @operation
		, @errorMessage = @errorMessage ;

	IF @rc <> 0
		RAISERROR (@errorMessage, 16, 0) ;
END