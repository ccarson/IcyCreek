CREATE TRIGGER dbo.mc_contact_orgroles_trigger
            ON dbo.mc_contact_orgroles
INSTEAD OF INSERT, UPDATE, DELETE
AS
/*
************************************************************************************************************************************

    Trigger:  dbo.mc_contact_orgroles_trigger
     Author:  Chris Carson
    Purpose:  Prepares data for coreSHIELD processing

    revisor     date          description
    ---------   -----------   ----------------------------
    ccarson     2012-09-01    Created


    Logic Summary:

************************************************************************************************************************************
*/
BEGIN

    IF  @@ROWCOUNT = 0 RETURN ;

    SET NOCOUNT ON;

    DECLARE @dataXML           AS XML = NULL ;
    DECLARE @operation         AS NVARCHAR(20) ;
    DECLARE @rc                AS INT ;
    DECLARE @errorMessage      AS NVARCHAR(MAX) ;
    DECLARE @recordsIN         AS INT ;
    DECLARE @recordsInserted   AS INT ;
    DECLARE @recordsUpdated    AS INT ;
    DECLARE @recordsDeleted    AS INT ;
    DECLARE @tableID           AS INT ;
    DECLARE @systemID          AS INT ;

    SELECT  @tableID = id
      FROM  mcCoreShield.dbo.coreConvertedTables
     WHERE  tableName = 'mc_contact_orgroles' ;

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

    EXEC @rc = mcCoreShield.dbo.process_mc_contact_orgroles @systemID
                                                          , @tableID
                                                          , @recordsIN
                                                          , @dataXML
                                                          , @operation
                                                          , @errorMessage OUTPUT ;

    IF  @rc <> 0
        RAISERROR (@errorMessage, 16, 0) ;

END
