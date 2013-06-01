CREATE PROCEDURE dbo.mc_organizationDELETE ( @systemID     AS INT
                                           , @recordsIN    AS INT
                                           , @dataXML      AS XML
                                           , @errorMessage AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:  dbo.mc_organizationDELETE
     Author:  Chris Carson
    Purpose:  DELETEs dbo.Organizations and related coreSHIELD records based on portal view data

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2013-03-05      created


    Logic Summary:
    1)  Load temp storage with shredded XML data
    2)  UPDATE temp storage with coreSHIELD related IDs
    3)  DELETE temp storage data from dbo.OrganizationSystems
    4)  DELETE temp storage data from dbo.Organizations

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
          , @codeBlockDesc03    AS NVARCHAR (128)   = 'DELETE temp storage data from dbo.OrganizationSystems'
          , @codeBlockDesc04    AS NVARCHAR (128)   = 'DELETE temp storage data from dbo.Organizations' ;

    DECLARE @controlCount       AS INT
          , @controlTotalsError AS NVARCHAR(200)    = N'Control Total Failure:  %s = %d, %s = %d' ;


    DECLARE @sourceData         AS TABLE ( id               INT
                                         , systemID         INT
                                         , organizationID   UNIQUEIDENTIFIER ) ;


/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ; -- Load temp storage with shredded XML data

    INSERT  @sourceData
          ( id
          , systemID )
    SELECT  row.data.value( '@id[1]', 'int' )
          , @systemID
      FROM  @dataXML.nodes( 'row/data' ) AS row( data ) ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, '@dataXML INSERTs', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc01 ; -- UPDATE temp storage with coreSHIELD related IDs

    UPDATE  @sourceData
       SET  organizationID = ogs.ID
      FROM  @sourceData             AS src
INNER JOIN  dbo.OrganizationSystems AS ogs ON ogs.mc_organizationID = src.id AND ogs.systemID = src.systemID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; -- DELETE temp storage data from dbo.OrgLocationSystems

    DELETE  dbo.OrganizationSystems
      FROM  dbo.OrganizationSystems AS ogs
     WHERE  EXISTS ( SELECT 1 FROM @sourceData AS src
                      WHERE src.organizationID = ogs.ID AND src.systemID = ogs.systemID ) ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'OrgLocationSystem DELETEs', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ; -- DELETE temp storage data from dbo.OrgLocations

    DELETE  dbo.Organizations
      FROM  dbo.Organizations AS org
     WHERE  EXISTS ( SELECT 1 FROM @sourceData AS src WHERE src.organizationID = org.ID )
                AND
            NOT EXISTS ( SELECT 1 FROM dbo.OrganizationSystems AS ogs WHERE ogs.ID = org.ID ) ;


END TRY
BEGIN CATCH
    SELECT  @errorData = '<b>trigger data passed into coreShield</b></br></br>'
                       + '<table border="1">'
                       + '<tr><th>id</th><th>systemID</th><th>organizationID</th></tr>'
                       + CAST ( ( SELECT  td = id, ''
                                        , td = systemID, ''
                                        , td = organizationID, ''
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