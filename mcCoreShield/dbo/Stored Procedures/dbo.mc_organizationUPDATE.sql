CREATE PROCEDURE dbo.mc_organizationUPDATE ( @systemID     AS INT
                                           , @recordsIN    AS INT
                                           , @dataXML      AS XML
                                           , @errorMessage AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:  dbo.mc_organizationUPDATE
     Author:  Chris Carson
    Purpose:  UPDATEs portal view data for dbo.OrgLocations and related tables on coreSHIELD

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2013-03-05      created


    Logic Summary:
    1)  Load temp storage with shredded XML data
    2)  UPDATE temp storage with coreSHIELD related IDs
    3)  UPDATE dbo.Organizations from temp storage
    4)  UPDATE dbo.OrganizationSystems from temp storage


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
          , @codeBlockDesc03    AS NVARCHAR (128)   = 'UPDATE dbo.Organizations from temp storage'
          , @codeBlockDesc04    AS NVARCHAR (128)   = 'UPDATE dbo.OrganizationSystems from temp storage' ;

    DECLARE @controlCount       AS INT
          , @controlTotalsError AS NVARCHAR(200)    = N'Control Total Failure:  %s = %d, %s = %d' ;


    DECLARE @sourceData         AS TABLE ( legacyID        INT
                                         , Name            NVARCHAR (255)
                                         , Website         NVARCHAR (255)
                                         , Status          NVARCHAR (50)
                                         , Summary         NVARCHAR (500)
                                         , type_id         INT
                                         , vertical_id     INT
                                         , active          BIT
                                         , brand_id        INT
                                         , is_demo         BIT
                                         , temp            BIT
                                         , date_added      DATETIME2 (7)
                                         , added_by        INT
                                         , date_updated    DATETIME2 (7)
                                         , updated_by      INT
                                         , portalName      NVARCHAR (20)
                                         , systemID        INT
                                         , organizationID  UNIQUEIDENTIFIER
                                         , createdID       UNIQUEIDENTIFIER
                                         , updatedID       UNIQUEIDENTIFIER )


/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ; -- Load temp storage with shredded XML data

    INSERT  @sourceData
          ( legacyID
          , Name
          , Website
          , Status
          , Summary
          , type_id
          , vertical_id
          , active
          , brand_id
          , is_demo
          , temp
          , date_added
          , added_by
          , date_updated
          , updated_by
          , systemID )
    SELECT  row.data.value( '@id[1]',     'int')
          , row.data.value( '@Name[1]',         'nvarchar(255)' )
          , row.data.value( '@Website[1]',      'nvarchar(255)' )
          , row.data.value( '@Status[1]',       'nvarchar(50)' )
          , row.data.value( '@Summary[1]',      'nvarchar(500)' )
          , row.data.value( '@type_id[1]',      'int' )
          , row.data.value( '@vertical_id[1]',  'int' )
          , row.data.value( '@active[1]',       'bit' )
          , row.data.value( '@brand_id[1]',     'bit' )
          , row.data.value( '@is_demo[1]',      'bit' )
          , row.data.value( '@temp[1]',         'bit' )
          , row.data.value( '@date_added[1]',   'datetime2' )
          , row.data.value( '@added_by[1]',     'int' )
          , row.data.value( '@date_updated[1]', 'datetime2' )
          , row.data.value( '@updated_by[1]',   'int' )
          , @systemID
      FROM  @dataXML.nodes( 'row/data' ) AS row( data ) ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, '@dataXML INSERT', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc02 ; --  UPDATE temp storage with coreSHIELD related IDs

    UPDATE  @sourceData
       SET  organizationID = ogs.ID
          , createdID   = cn1.ID
          , updatedID   = cn2.ID
      FROM  @sourceData             AS src
INNER JOIN  dbo.OrganizationSystems AS ogs ON ogs.mc_organizationID = src.legacyID    AND ogs.systemID = src.systemID
 LEFT JOIN  dbo.ContactSystems      AS cn1 ON cn1.mc_ContactID      = src.added_by    AND cn1.systemID = src.systemID
 LEFT JOIN  dbo.ContactSystems      AS cn2 ON cn2.mc_ContactID      = src.updated_by  AND cn2.systemID = src.systemID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; --  UPDATE dbo.Organizations from temp storage

    UPDATE  dbo.Organizations
       SET  Name        = src.Name
          , Website     = src.Website
          , Status      = src.Status
          , Summary     = src.Summary
          , isActive    = src.active
          , isDemo      = src.is_demo
          , isTemp      = src.temp
          , brandID     = src.brand_id
          , createdBy   = src.createdID
          , createdOn   = src.date_added
          , updatedBy   = src.updatedID
          , updatedOn   = src.date_updated
      FROM  dbo.Organizations   AS org
INNER JOIN  @sourceData         AS src ON src.organizationID = org.ID ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'OrgLocation UPDATEs', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ; --  UPDATE dbo.OrganizationSystems from temp storage

    UPDATE  dbo.OrganizationSystems
       SET  organizationTypeID = src.type_id
          , verticalID         = src.vertical_id
          , createdBy          = src.createdID
          , updatedBy          = src.updatedID
          , createdOn          = src.date_added
          , updatedOn          = src.date_updated
      FROM  dbo.OrganizationSystems   AS ogs
INNER JOIN  @sourceData               AS src ON src.organizationID = ogs.ID AND src.systemID = ogs.systemID ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'OrgLocation UPDATEs', @controlCount ) ;

END TRY
BEGIN CATCH
    SELECT  @errorData = '<b>trigger data passed into coreShield</b></br></br>'
                       + '<table border="1">'
                       + '<tr><th>legacyID</th><th>Name</th><th>Website</th><th>Status</th><th>Summary</th>'
                       + '<th>type_id</th><th>vertical_id</th><th>active</th><th>brand_id</th>'
                       + '<th>is_demo</th><th>temp</th><th>date_added</th><th>added_by</th>'
                       + '<th>date_updated</th><th>updated_by</th><th>systemID</th><th>organizationID</th>'
                       + '<th>createdID</th><th>updatedID</th></tr>'
                       + CAST ( ( SELECT  td = legacyID, ''
                                        , td = Name, ''
                                        , td = Website, ''
                                        , td = Status, ''
                                        , td = Summary, ''
                                        , td = type_id, ''
                                        , td = vertical_id, ''
                                        , td = active, ''
                                        , td = brand_id, ''
                                        , td = is_demo, ''
                                        , td = temp, ''
                                        , td = date_added, ''
                                        , td = added_by, ''
                                        , td = date_updated, ''
                                        , td = updated_by, ''
                                        , td = systemID, ''
                                        , td = organizationID, ''
                                        , td = createdID, ''
                                        , td = updatedID, ''
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