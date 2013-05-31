CREATE PROCEDURE dbo.mc_organizationINSERT ( @systemID     AS INT
                                           , @recordsIN    AS INT
                                           , @dataXML      AS XML
                                           , @errorMessage AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:  dbo.mc_organizationINSERT
     Author:  Chris Carson
    Purpose:  INSERTs portal view data into dbo.Organizations and related tables on coreSHIELD

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2013-03-05      created


    Logic Summary:
    1)  Load temp storage with shredded XML data
    2)  SELECT legacyID for new records
    3)  UPDATE temporary storage with legacyID
    4)  UPDATE temp storage with coreSHIELD related IDs
    5)  INSERT into dbo.Organizations from temp storage with new name field
    6)  UPDATE dbo.Organizations from temp storage with new name field
    7)  INSERT into dbo.OrganizationSystems from temp storage

    NOTES
        This proc also converts legacy records from an existing system.
        Records that are INSERTed onto portal mc_organization with the id field already filled in
            carry that ID into coreShield

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
          , @codeBlockDesc02    AS NVARCHAR (128)   = 'SELECT legacyID for new records'
          , @codeBlockDesc03    AS NVARCHAR (128)   = 'UPDATE temporary storage with legacyID'
          , @codeBlockDesc04    AS NVARCHAR (128)   = 'UPDATE temp storage with coreSHIELD related IDs'
          , @codeBlockDesc05    AS NVARCHAR (128)   = 'UPDATE temporary storage with organizationID when names match'
          , @codeBlockDesc06    AS NVARCHAR (128)   = 'MERGE temporary storage into dbo.Organizations'
          , @codeBlockDesc07    AS NVARCHAR (128)   = 'INSERT into dbo.OrganizationSystems from temp storage' ;

    DECLARE @controlCount       AS INT
          , @controlTotalsError AS NVARCHAR(200)    = N'Control Total Failure:  %s = %d, %s = %d' ;


    DECLARE @legacyID           AS INT = 0 ;

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
                                         , organizationID  UNIQUEIDENTIFIER     PRIMARY KEY CLUSTERED DEFAULT NEWSEQUENTIALID()
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
    SELECT  row.data.value( '@id[1]',           'int')
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
/**/      , @codeBlockDesc  = @codeBlockDesc02 ; -- SELECT legacyID for new records

    SELECT  @legacyID = COALESCE( MAX( mc_organizationID ), 0 )
      FROM  dbo.OrganizationSystems WHERE systemID = @systemID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; -- UPDATE temporary storage with legacyID

    UPDATE  @sourceData
       SET  @legacyID = legacyID = @legacyID + 1
     WHERE  legacyID IS NULL ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ; -- UPDATE temp storage with coreSHIELD related IDs

    UPDATE  @sourceData
       SET  createdID   = cn1.ID
          , updatedID   = cn2.ID
      FROM  @sourceData             AS src
 LEFT JOIN  dbo.ContactSystems      AS cn1 ON cn1.mc_ContactID      = src.added_by      AND cn1.systemID = src.systemID
 LEFT JOIN  dbo.ContactSystems      AS cn2 ON cn2.mc_ContactID      = src.updated_by    AND cn2.systemID = src.systemID ;


/**/SELECT  @codeBlockNum   = 5
/**/      , @codeBlockDesc  = @codeBlockDesc05 ; -- UPDATE temporary storage with organizationID when names match

      WITH  existingOrgs AS (
            SELECT organizationID, name, N = ROW_NUMBER() OVER ( PARTITION BY organizationID, name ORDER BY date_updated DESC )
              FROM Core.mc_organization AS org
             WHERE EXISTS ( SELECT 1 FROM @sourceData AS src where src.name = org.name ) )
    UPDATE  @sourceData
       SET  organizationID = ext.organizationID
      FROM  @sourceData     AS src
INNER JOIN  existingOrgs    AS ext ON ext.name = src.name
     WHERE  ext.N = 1 ;


/**/SELECT  @codeBlockNum   = 6
/**/      , @codeBlockDesc  = @codeBlockDesc06 ; -- MERGE temporary storage into dbo.Organizations

     MERGE  dbo.Organizations   AS tgt
     USING  @sourceData         AS src ON src.organizationID = tgt.ID
      WHEN  MATCHED THEN
            UPDATE  SET Name        = src.Name
                      , Website     = src.Website
                      , Status      = src.Status
                      , Summary     = src.Summary
                      , isActive    = src.active
                      , isDemo      = COALESCE( src.is_demo, 0 )
                      , isTemp      = src.temp
                      , brandID     = src.brand_id
                      , createdOn   = src.date_added
                      , createdBy   = src.createdID
                      , updatedOn   = src.date_updated
                      , updatedBy   = src.updatedID
      WHEN  NOT MATCHED BY TARGET THEN
            INSERT  ( ID, Name, Website, Status, Summary
                        , isActive, isDemo, isTemp, brandID
                        , createdOn, createdBy,updatedOn, updatedBy )
            VALUES  ( src.organizationID, src.Name, src.Website, src.Status, src.Summary
                        , src.active, COALESCE( src.is_demo, 0 ), src.temp, src.brand_id
                        , src.date_added, src.createdID, src.date_updated, src.updatedID ) ;
    SELECT  @controlCount = @@ROWCOUNT ;

    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'Organizations MERGE', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 7
/**/      , @codeBlockDesc  = @codeBlockDesc07 ; -- INSERT into dbo.OrganizationSystems from temp storage

    INSERT  dbo.OrganizationSystems (
            id, systemID, organizationTypeID, verticalID
                , createdBy, updatedBy, createdOn, updatedOn
                , mc_organizationID )
    SELECT  organizationID, systemID, type_id, vertical_id
                , createdID, updatedID, date_added, date_updated
                , legacyID
      FROM  @sourceData ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'OrgLocationSystems INSERTs', @controlCount ) ;


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