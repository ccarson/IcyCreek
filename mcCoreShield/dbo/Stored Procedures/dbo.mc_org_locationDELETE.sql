CREATE PROCEDURE dbo.mc_org_locationDELETE ( @systemID     AS INT
                                           , @recordsIN    AS INT
                                           , @dataXML      AS XML
                                           , @errorMessage AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:  dbo.mc_org_locationDELETE
     Author:  Chris Carson
    Purpose:  DELETEs dbo.OrgLocation and related coreSHIELD records based on portal view data

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2013-03-05      created


    Logic Summary:
    1)  Load temp storage with shredded XML data
    2)  UPDATE temp storage with coreSHIELD related IDs
    3)  DELETE temp storage data from dbo.OrgLocationSystems
    4)  DELETE temp storage data from dbo.OrgLocations

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
          , @codeBlockDesc03    AS NVARCHAR (128)   = 'DELETE temp storage data from dbo.OrgLocationSystems'
          , @codeBlockDesc04    AS NVARCHAR (128)   = 'DELETE temp storage data from dbo.OrgLocations' ;

    DECLARE @controlCount       AS INT
          , @controlTotalsError AS NVARCHAR(200)    = N'Control Total Failure:  %s = %d, %s = %d' ;


    DECLARE @sourceData         AS TABLE ( id                   INT
                                         , systemID             INT              
                                         , orgLocationID        UNIQUEIDENTIFIER ) ; 


/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ; -- Load temp storage with shredded XML data

    INSERT  @sourceData
          ( id
          , systemID ) 
    SELECT  row.data.value( '@id[1]', 'int' )
          , @systemID
      FROM  @dataXML.nodes( 'row/data' ) AS row( data ) ;


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc01 ; -- UPDATE temp storage with coreSHIELD related IDs

    UPDATE  @sourceData
       SET  orgLocationID = ols.ID
      FROM  @sourceData             AS src
INNER JOIN  dbo.OrgLocationSystems  AS ols ON ols.mc_org_locationID = src.id AND ols.systemID = src.systemID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; -- DELETE temp storage data from dbo.OrgLocationSystems
    
    DELETE  dbo.OrgLocationSystems
      FROM  dbo.OrgLocationSystems AS ols
     WHERE  EXISTS ( SELECT 1 FROM @sourceData AS src
                      WHERE src.orgLocationID = ols.ID AND src.systemID = ols.systemID ) ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'OrgLocationSystem DELETEs', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ; -- DELETE temp storage data from dbo.OrgLocations

    DELETE  dbo.OrgLocations
      FROM  dbo.OrgLocations AS ogl
     WHERE  EXISTS ( SELECT 1 FROM @sourceData AS src WHERE src.orgLocationID = ogl.ID )
                AND
            NOT EXISTS ( SELECT 1 FROM dbo.OrgLocationSystems AS ols WHERE ols.ID = ogl.ID ) ;


END TRY
BEGIN CATCH
    SELECT  @errorData = '<b>trigger data passed into coreShield</b></br></br>'
                       + '<table border="1">'
                       + '<tr><th>id</th><th>systemID</th><th>orgLocationID</th></tr>'
                       + CAST ( ( SELECT  td = id, ''
                                        , td = systemID, ''
                                        , td = orgLocationID, ''
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