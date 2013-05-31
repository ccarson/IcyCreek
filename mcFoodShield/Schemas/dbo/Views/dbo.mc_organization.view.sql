CREATE VIEW dbo.mc_organization
AS
/*
************************************************************************************************************************************

       View:    dbo.mc_organization
     Author:    Chris Carson
    Purpose:    portal view of dbo.Organizations data

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2012-09-01      Created
    ccarson     2013-03-05      refactored to use Core.mc_organization view


    Notes

************************************************************************************************************************************
*/
    SELECT  id              = id
          , Name            = Name
          , Website         = Website
          , Status          = Status
          , Summary         = Summary
          , type_id         = type_id
          , vertical_id     = vertical_id
          , active          = active
          , brand_id        = brand_id
          , is_demo         = is_demo
          , temp            = temp
          , date_added      = date_added
          , added_by        = added_by
          , date_updated    = date_updated
          , updated_by      = updated_by
      FROM  Core.mc_organization
     WHERE  portalName = 'mcFoodShield ' ; 
            

GO
CREATE TRIGGER  mc_organizationTR
            ON  dbo.mc_organization
INSTEAD OF INSERT, DELETE, UPDATE
AS
/*
************************************************************************************************************************************

    Trigger:  dbo.mc_organization_trigger
     Author:  Chris Carson
    Purpose:  Prepares data for coreSHIELD processing

    revisor     date          description
    ---------   -----------   ----------------------------
    ccarson     2013-03-05    created


    Logic Summary:

************************************************************************************************************************************
*/
BEGIN
BEGIN TRY
    IF  NOT EXISTS ( SELECT 1 FROM inserted )
            AND
        NOT EXISTS ( SELECT 1 FROM deleted )
        RETURN ;

    SET NOCOUNT ON;

    DECLARE @codeBlockDesc01        AS NVARCHAR (128)    = 'SELECT @systemID -- passed to coreShield'
          , @codeBlockDesc02        AS NVARCHAR (128)    = 'SELECT @dataXML from trigger tables depending on triggering operation'
          , @codeBlockDesc03        AS NVARCHAR (128)    = 'EXECUTE coreShield process for INSERTs'
          , @codeBlockDesc04        AS NVARCHAR (128)    = 'EXECUTE coreShield process for UPDATEs'
          , @codeBlockDesc05        AS NVARCHAR (128)    = 'EXECUTE coreShield process for DELETEs' ;

    DECLARE @databaseName           AS SYSNAME = DB_NAME()
          , @codeBlockNum           AS INT
          , @codeBlockDesc          AS NVARCHAR (128)
          , @errorTypeID            AS INT
          , @errorSeverity          AS INT
          , @errorState             AS INT
          , @errorNumber            AS INT
          , @errorLine              AS INT
          , @errorProcedure         AS NVARCHAR (128)
          , @errorMessage           AS NVARCHAR (MAX) = NULL
          , @errorData              AS NVARCHAR (MAX) = NULL ;

    DECLARE @systemID           AS INT             = 0
          , @recordsIN          AS INT             = 0
          , @dataXML            AS XML             = NULL ;


/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01  ; --  SELECT @systemID -- passed to coreShield

    SELECT  @systemID = ID FROM Core.Systems WHERE systemName = 'mcFoodShield' ;


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc02  ; --  SELECT @dataXML from trigger tables depending on triggering operation

    IF  EXISTS ( SELECT 1 FROM inserted )         --  INSERTs and UPDATEs
    BEGIN
        SELECT  @recordsIN = COUNT(*) FROM inserted ;
        SELECT  @dataXML  = ( SELECT * FROM inserted AS data
                                 FOR XML AUTO, ROOT( N'row' ) ) ;
    END
        ELSE                                      --  DELETEs
    BEGIN
        SELECT  @recordsIN = COUNT(*) FROM deleted ;
        SELECT  @dataXML  = ( SELECT * FROM deleted AS data
                                 FOR XML AUTO, ROOT( N'row' ) ) ;
    END


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03  ; --  EXECUTE coreShield process for INSERTs

    IF  EXISTS ( SELECT 1 FROM inserted ) AND NOT EXISTS ( SELECT 1 FROM deleted )
        EXECUTE Core.mc_organizationINSERT  @systemID
                                          , @recordsIN
                                          , @dataXML
                                          , @errorMessage OUTPUT ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04  ; --  EXECUTE coreShield process for UPDATEs

    IF  EXISTS ( SELECT 1 FROM inserted ) AND EXISTS ( SELECT 1 FROM deleted )
        EXECUTE Core.mc_organizationUPDATE  @systemID
                                          , @recordsIN
                                          , @dataXML
                                          , @errorMessage OUTPUT ;


/**/SELECT  @codeBlockNum   = 5
/**/      , @codeBlockDesc  = @codeBlockDesc05  ; --  EXECUTE coreShield process for DELETEs

    IF  NOT EXISTS ( SELECT 1 FROM inserted ) AND EXISTS ( SELECT 1 FROM deleted )
        EXECUTE Core.mc_organizationDELETE  @systemID
                                          , @recordsIN
                                          , @dataXML
                                          , @errorMessage OUTPUT ;


END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION ;

    SELECT  @errorSeverity  = ERROR_SEVERITY()
          , @errorState     = ERROR_STATE()
          , @errorNumber    = ERROR_NUMBER()
          , @errorLine      = ERROR_LINE()
          , @errorProcedure = ERROR_PROCEDURE() ;

    IF  @errorMessage IS NULL
    BEGIN
        SELECT  @errorMessage = ERROR_MESSAGE()
        
        EXECUTE Core.processSQLError @databaseName
                                   , @codeBlockNum
                                   , @codeBlockDesc
                                   , @errorNumber
                                   , @errorSeverity
                                   , @errorState
                                   , @errorProcedure
                                   , @errorLine
                                   , @errorMessage
                                   , @errorData ;
                                   
        SELECT  @errorMessage = N'Error occurred in Code Block %d, %s ' + CHAR(13)
                              + N'Error %d, Level %d, State %d, Procedure %s, Line %d, Message: ' + ERROR_MESSAGE() ;

        RAISERROR( @errorMessage, @errorSeverity, 1
                 , @codeBlockNum
                 , @codeBlockDesc
                 , @errorNumber
                 , @errorSeverity
                 , @errorState
                 , @errorProcedure
                 , @errorLine ) ;

    END
        ELSE
    BEGIN
        SELECT  @errorSeverity  = ERROR_SEVERITY()
              , @errorState     = ERROR_STATE()

        RAISERROR( @errorMessage, @errorSeverity, @errorState ) ;
    END

END CATCH
END