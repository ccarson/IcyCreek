CREATE PROCEDURE dbo.mc_contactDELETE  ( @systemID     AS INT
                                       , @recordsIN    AS INT
                                       , @dataXML      AS XML
                                       , @errorMessage AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:  dbo.mc_contactDELETE
     Author:  Chris Carson
    Purpose:  DELETEs dbo.Contacts data and related table data from coreSHIELD based on incoming trigger data

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2013-03-05      created


    Logic Summary:
    1)  Load temp storage with shredded XML data
    2)  UPDATE temp storage with coreSHIELD related IDs
    3)  DELETE matching data from dbo.ContactSystems
    4)  DELETE matching data from dbo.Contacts with no records on dbo.ContactSystems

************************************************************************************************************************************
*/
BEGIN
BEGIN TRY
    SET NOCOUNT ON ;

    DECLARE @databaseName       AS SYSNAME          = DB_NAME()
          , @codeBlockNum       AS INT              = NULL
          , @codeBlockDesc      AS NVARCHAR (128)   = NULL
          , @errorLine          AS INT
          , @errorNumber        AS INT
          , @errorProcedure     AS SYSNAME
          , @errorSeverity      AS INT
          , @errorState         AS INT
          , @errorData          AS NVARCHAR (MAX) ;

    DECLARE @codeBlockDesc01    AS NVARCHAR (128)   = 'Load temp storage with shredded XML data'
          , @codeBlockDesc02    AS NVARCHAR (128)   = 'UPDATE temp storage with coreSHIELD related IDs'
          , @codeBlockDesc03    AS NVARCHAR (128)   = 'DELETE temp storage data from dbo.ContactSystems'
          , @codeBlockDesc04    AS NVARCHAR (128)   = 'DELETE matching data from dbo.Contacts with no records on dbo.ContactSystems'

    DECLARE @controlCount       AS INT
          , @controlTotalsError AS NVARCHAR(200)    = N'Control Total Failure:  %s = %d, %s = %d' ;


    DECLARE @sourceData         AS TABLE ( id           INT
                                         , systemID     INT
                                         , contactID    UNIQUEIDENTIFIER ) ;


/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ;  -- Load temp storage with shredded XML data

    INSERT  @sourceData
          ( id
          , systemID )
    SELECT  row.data.value( '@id[1]', 'int' )
          , @systemID
      FROM  @dataXML.nodes('row/data') AS row(data) ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, '@dataXML INSERT', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc02 ;  -- UPDATE temp storage with coreSHIELD related IDs

    UPDATE  @sourceData
       SET  contactID   = cns.ID
      FROM  @sourceData         AS src
INNER JOIN  dbo.ContactSystems  AS cns ON cns.mc_contactID = src.id AND cns.systemID = src.systemID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ;  -- DELETE temp storage data from dbo.ContactSystems

    DELETE  dbo.ContactSystems
      FROM  dbo.ContactSystems AS cns
     WHERE  EXISTS ( SELECT 1 FROM @sourceData AS src
                      WHERE src.contactID = cns.ID AND src.systemID = cns.systemID ) ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'ContactSystems DELETEs', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ;  -- DELETE matching data from dbo.Contacts with no records on dbo.ContactSystems

    DELETE  dbo.Contacts
      FROM  dbo.Contacts AS cnt
     WHERE  EXISTS ( SELECT 1 FROM @sourceData AS src WHERE src.contactID = cnt.ID )
                AND
       NOT  EXISTS ( SELECT 1 FROM dbo.ContactSystems AS cns WHERE cns.ID = cnt.ID ) ;


END TRY
BEGIN CATCH
    SELECT  @errorData = '<b>trigger data passed into coreShield</b></br></br>'
                       + '<table border="1">'
                       + '<tr><th>ID</th><th>systemID</th><th>contactID</th></tr>'
                       + CAST ( ( SELECT  td = ID, ''
                                       ,  td = systemID, ''
                                       ,  td = contactID, ''
                                    FROM  @sourceData
                                     FOR  XML PATH('tr'), ELEMENTS XSINIL, TYPE ) AS NVARCHAR(MAX) ) ;

    SELECT  @errorSeverity  = ERROR_SEVERITY()
          , @errorState     = ERROR_STATE()
          , @errorNumber    = ERROR_NUMBER()
          , @errorLine      = ERROR_LINE()
          , @errorProcedure = ERROR_PROCEDURE()
          , @errorMessage   = ERROR_MESSAGE() ;

    EXECUTE Utility.processSQLError @databaseName
                                  , @codeBlockNum
                                  , @codeBlockDesc
                                  , @errorNumber
                                  , @errorSeverity
                                  , @errorState
                                  , @errorProcedure
                                  , @errorLine
                                  , @errorMessage
                                  , @errorData ;

    SELECT  @errorMessage = N'Error occurred in Code Block %d, %s ' + CHAR(13) +
                            N'Message %d, Level %d, State %d, Procedure %s, Line %d, Details: ' + ERROR_MESSAGE() ;

    RAISERROR( @errorMessage, @errorSeverity, 1
             , @codeBlockNum
             , @codeBlockDesc
             , @errorNumber
             , @errorSeverity
             , @errorState
             , @errorProcedure
             , @errorLine ) ;

END CATCH
END