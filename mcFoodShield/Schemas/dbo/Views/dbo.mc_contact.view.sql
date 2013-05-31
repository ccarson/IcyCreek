CREATE VIEW dbo.mc_contact
/*
************************************************************************************************************************************

       View:  dbo.mc_contact
     Author:  ccarson
    Purpose:  shows Core version of mc_contact view, showing all portal data in a single view


    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         2013-03-05          created

    Notes:
    This is the "all portals" equivalent of the portal view of the same name.
    There are more columns in this view than the portal version:
        systemName ( same as portalName )
        coreIDs -- shows coreShield IDs for foreign key fields
    Showing coreShield IDs in this view allows for system-wide queries
        ( show me all locations for organization X, regardless of portal )

************************************************************************************************************************************
*/
AS
    SELECT  id                  = id
          , Salutation          = Salutation
          , JobTitle            = JobTitle
          , Firstname           = Firstname
          , Initial             = Initial
          , Lastname            = Lastname
          , Suffix              = Suffix
          , Email               = Email
          , Login               = Login
          , Password            = Password
          , salt                = salt
          , AccessID            = AccessID
          , Expires             = Expires
          , Hits                = Hits
          , LastLogin           = LastLogin
          , Status              = Status
          , ModifiedBy          = ModifiedBy
          , DateModified        = DateModified
          , datejoined          = datejoined
          , membertype          = membertype
          , photo               = photo
          , resume              = resume
          , thumb               = thumb
          , PIN                 = PIN
          , reset               = reset
          , mailsent            = mailsent
          , sysmember           = sysmember
          , maildate            = maildate
          , updatesent          = updatesent
          , updatenum           = updatenum
          , nosend              = nosend
          , hidden              = hidden
          , security_level      = security_level
          , review              = review
          , Q1                  = Q1
          , Q2                  = Q2
          , Q3                  = Q3
          , iAnswer             = iAnswer
          , ipMac               = ipMac
          , frequency_id        = frequency_id
          , refer               = refer
          , is_active           = is_active
          , TimeZone            = TimeZone
          , usesDaylight        = usesDaylight
          , TzOffset            = TzOffset
          , iDefault_Quota      = iDefault_Quota
          , iDoc_Usage          = iDoc_Usage
          , assist_id           = assist_id
          , layout              = layout
          , bTOS                = bTOS
          , bOnlineNow          = bOnlineNow
          , uID                 = uID
          , iwkgrplayout        = iwkgrplayout
          , sAboutMe            = sAboutMe
          , folder_id           = folder_id
          , signature           = signature
          , dateAdded           = dateAdded
          , addedBy             = addedBy
          , bAuditLock          = bAuditLock
          , bProfileUpdate      = bProfileUpdate
          , bexpirereminder     = bexpirereminder
          , bPingSent           = bPingSent
          , dPingDate           = dPingDate
          , bVerified           = bVerified
          , iVerifiedBy         = iVerifiedBy
          , dVerifiedDate       = dVerifiedDate
          , inetwork            = inetwork
          , isSuspect           = isSuspect
      FROM  Core.mc_contact
     WHERE  portalName = 'mcFoodShield' ;
GO
CREATE TRIGGER  mc_contactTR
            ON  dbo.mc_contact
INSTEAD OF INSERT, UPDATE, DELETE
AS
/*
************************************************************************************************************************************

    Trigger:    mc_contactTR
     Author:    Chris Carson
    Purpose:    Prepares view data for coreShield processing


    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         2013-03-05          created ( splitting and merging of Contacts )

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
        EXECUTE Core.mc_contactINSERT  @systemID
                                     , @recordsIN
                                     , @dataXML
                                     , @errorMessage OUTPUT ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04  ; --  EXECUTE coreShield process for UPDATEs

    IF  EXISTS ( SELECT 1 FROM inserted ) AND EXISTS ( SELECT 1 FROM deleted )
        EXECUTE Core.mc_contactUPDATE  @systemID
                                     , @recordsIN
                                     , @dataXML
                                     , @errorMessage OUTPUT ;


/**/SELECT  @codeBlockNum   = 5
/**/      , @codeBlockDesc  = @codeBlockDesc05  ; --  EXECUTE coreShield process for DELETEs

    IF  NOT EXISTS ( SELECT 1 FROM inserted ) AND EXISTS ( SELECT 1 FROM deleted )
        EXECUTE Core.mc_contactDELETE  @systemID
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