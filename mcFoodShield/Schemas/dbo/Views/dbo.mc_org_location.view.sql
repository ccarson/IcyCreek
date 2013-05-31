﻿CREATE VIEW dbo.mc_org_location
/*
************************************************************************************************************************************

       View:  dbo.mc_org_location
     Author:  ccarson
    Purpose:  shows portal view of Core.mc_org_location view, showing data only for specified portal


    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         2013-03-05          created

    Notes:

************************************************************************************************************************************
*/
AS
    SELECT  id                  = id
          , org_id              = org_id
          , addressTypeID       = addressTypeID
          , name                = name
          , address1            = address1
          , address2            = address2
          , address3            = address3
          , city                = city
          , state               = state
          , zip                 = zip
          , d_phone             = d_phone
          , d_fax               = d_fax
          , active              = active
          , notes               = notes
          , country             = country
          , d_emergency_phone   = d_emergency_phone
          , d_24hr_phone        = d_24hr_phone
          , d_infectious_phone  = d_infectious_phone
          , bAlternate          = bAlternate
          , date_added          = date_added
          , date_updated        = date_updated
      FROM  Core.mc_org_location
     WHERE  portalName = 'mcFoodShield' ;
GO
CREATE TRIGGER  mc_org_locationTR
            ON  dbo.mc_org_location
INSTEAD OF INSERT, UPDATE, DELETE
AS
/*
************************************************************************************************************************************

    Trigger:    mc_org_locationTR
     Author:    Chris Carson
    Purpose:    Prepares view data for coreShield processing


    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         2013-03-05          created ( splitting and merging of OrgLocations )

    Logic Summary:
    1)  SELECT @systemID -- passed to coreShield
    2)  SELECT @dataXML from trigger tables depending on triggering operation
    3)  EXECUTE coreShield process for INSERTs
    4)  EXECUTE coreShield process for UPDATEs
    5)  EXECUTE coreShield process for DELETEs

    NOTES
    Steps 3), 4) and 5) execute depending on triggering operation.
    Infer triggering operation from contents of inserted and deleted trigger tables
        When only inserted has data, the triggering operation was INSERT
        When only deleted has data, the triggering operation was DELETE
        When both inserted and deleted have data, the triggering operation was UPDATE

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
        EXECUTE Core.mc_org_locationINSERT  @systemID
                                          , @recordsIN
                                          , @dataXML
                                          , @errorMessage OUTPUT ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04  ; --  EXECUTE coreShield process for UPDATEs

    IF  EXISTS ( SELECT 1 FROM inserted ) AND EXISTS ( SELECT 1 FROM deleted )
        EXECUTE Core.mc_org_locationUPDATE  @systemID
                                          , @recordsIN
                                          , @dataXML
                                          , @errorMessage OUTPUT ;


/**/SELECT  @codeBlockNum   = 5
/**/      , @codeBlockDesc  = @codeBlockDesc05  ; --  EXECUTE coreShield process for DELETEs

    IF  NOT EXISTS ( SELECT 1 FROM inserted ) AND EXISTS ( SELECT 1 FROM deleted )
        EXECUTE Core.mc_org_locationDELETE  @systemID
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