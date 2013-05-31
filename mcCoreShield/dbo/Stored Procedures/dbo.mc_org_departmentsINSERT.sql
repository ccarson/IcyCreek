CREATE PROCEDURE dbo.mc_org_departmentsINSERT ( @systemID       AS INT
                                              , @recordsIN      AS INT
                                              , @dataXML        AS XML
                                              , @errorMessage   AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:  dbo.mc_org_departmentsINSERT
     Author:  Chris Carson
    Purpose:  load mc_org_department view data into coreSHIELD dbo.OrgDepartments and related tables

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2013-03-05      created


    Logic Summary:
    1)  Load temp storage with shredded XML data
    2)  SELECT legacyID for new records
    3)  UPDATE temporary storage with legacyID
    4)  UPDATE temp storage with coreSHIELD related IDs
    5)  INSERT into dbo.OrgDepartments from temp storage
    6)  INSERT into dbo.OrgDepartmentSystems from temp storage
    7)  UPDATE parentDepartmentID on dbo.OrgDepartments

    NOTES
        This proc also converts legacy records from an existing system.
        Records that are INSERTed onto portal mc_org_departments with the id field already filled in
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
          , @codeBlockDesc05    AS NVARCHAR (128)   = 'INSERT into dbo.OrgDepartments from temp storage'
          , @codeBlockDesc06    AS NVARCHAR (128)   = 'INSERT into dbo.OrgDepartmentSystems from temp storage'
          , @codeBlockDesc07    AS NVARCHAR (128)   = 'UPDATE parentDepartmentID on dbo.OrgDepartments' ;

    DECLARE @controlCount       AS INT
          , @controlTotalsError AS NVARCHAR(200)    = N'Control Total Failure:  %s = %d, %s = %d' ;


    DECLARE @legacyID           AS INT = 0 ;

    DECLARE @sourceData         AS TABLE ( legacyID             INT
                                         , name                 NVARCHAR (100)
                                         , org_id               INT
                                         , location_id          INT
                                         , parent_dept_id       INT
                                         , active               BIT
                                         , notes                NVARCHAR (MAX)
                                         , website              NVARCHAR (MAX)
                                         , org_level            INT
                                         , fern_active          BIT
                                         , is_searchable        BIT
                                         , micro                BIT
                                         , chem                 BIT
                                         , rad                  BIT
                                         , micro_date_accept    DATETIME2 (7)
                                         , micro_date_withdraw  DATETIME2 (7)
                                         , chem_date_accept     DATETIME2 (7)
                                         , chem_date_withdraw   DATETIME2 (7)
                                         , rad_date_accept      DATETIME2 (7)
                                         , rad_date_withdraw    DATETIME2 (7)
                                         , date_added           DATETIME2 (7)
                                         , added_by             INT
                                         , date_updated         DATETIME2 (7)
                                         , updated_by           INT
                                         , systemID             INT
                                         , orgDepartmentID      UNIQUEIDENTIFIER    DEFAULT NEWSEQUENTIALID()
                                         , organizationID       UNIQUEIDENTIFIER
                                         , orgLocationID        UNIQUEIDENTIFIER
                                         , createdByID          UNIQUEIDENTIFIER
                                         , updatedByID          UNIQUEIDENTIFIER ) ;


/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ;  -- Load temp storage with shredded XML data

    INSERT  @sourceData
          ( legacyID
          , name
          , org_id
          , location_id
          , parent_dept_id
          , active
          , notes
          , website
          , org_level
          , fern_active
          , is_searchable
          , micro
          , chem
          , rad
          , micro_date_accept
          , micro_date_withdraw
          , chem_date_accept
          , chem_date_withdraw
          , rad_date_accept
          , rad_date_withdraw
          , date_added
          , added_by
          , date_updated
          , updated_by
          , systemID )
    SELECT  row.data.value( '@id[1]',                   'int' )
          , row.data.value( '@name[1]',                 'nvarchar(100 )' )
          , row.data.value( '@org_id[1]',               'int' )
          , row.data.value( '@location_id[1]',          'int' )
          , row.data.value( '@parent_dept_id[1]',       'int' )
          , row.data.value( '@active[1]',               'bit' )
          , row.data.value( '@notes[1]',                'nvarchar(MAX )' )
          , row.data.value( '@website[1]',              'nvarchar(MAX )' )
          , row.data.value( '@org_level[1]',            'int' )
          , row.data.value( '@fern_active[1]',          'bit' )
          , row.data.value( '@is_searchable[1]',        'bit' )
          , row.data.value( '@micro[1]',                'bit' )
          , row.data.value( '@chem[1]',                 'bit' )
          , row.data.value( '@rad[1]',                  'bit' )
          , row.data.value( '@micro_date_accept[1]',    'datetime2' )
          , row.data.value( '@micro_date_withdraw[1]',  'datetime2' )
          , row.data.value( '@chem_date_accept[1]',     'datetime2' )
          , row.data.value( '@chem_date_withdraw[1]',   'datetime2' )
          , row.data.value( '@rad_date_accept[1]',      'datetime2' )
          , row.data.value( '@rad_date_withdraw[1]',    'datetime2' )
          , row.data.value( '@date_added[1]',           'datetime2' )
          , row.data.value( '@added_by[1]',             'int' )
          , row.data.value( '@date_updated[1]',         'datetime2' )
          , row.data.value( '@updated_by[1]',           'int' )
          , @systemID
      FROM  @dataXML.nodes('row/data') AS row(data) ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, '@dataXML INSERT', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc02 ;  -- SELECT legacyID for new records

    SELECT  @legacyID = COALESCE( MAX( mc_org_departmentsID ), 0 )
      FROM  dbo.OrgDepartmentSystems WHERE systemID = @systemID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ;  -- UPDATE temporary storage with legacyID

    UPDATE  @sourceData
       SET  @legacyID = legacyID = @legacyID + 1
     WHERE  legacyID IS NULL ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ;  -- UPDATE temp storage with coreSHIELD related IDs

    UPDATE  @sourceData
       SET  organizationID  = ogs.ID
          , orgLocationID   = ols.ID
          , createdByID     = cn1.ID
          , updatedByID     = cn2.ID
      FROM  @sourceData             AS src
INNER JOIN  dbo.OrganizationSystems AS ogs ON ogs.mc_organizationID = src.org_id        AND ogs.systemID = src.systemID
INNER JOIN  dbo.OrgLocationSystems  AS ols ON ols.mc_org_locationID = src.location_id   AND ols.systemID = src.systemID
 LEFT JOIN  dbo.ContactSystems      AS cn1 ON cn1.mc_ContactID      = src.added_by      AND cn1.systemID = src.systemID
 LEFT JOIN  dbo.ContactSystems      AS cn2 ON cn2.mc_ContactID      = src.updated_by    AND cn2.systemID = src.systemID ;


/**/SELECT  @codeBlockNum   = 5
/**/      , @codeBlockDesc  = @codeBlockDesc05 ;  -- INSERT into dbo.OrgDepartments from temp storage

    INSERT  dbo.OrgDepartments
         (  ID, name, organizationID, orgLocationID
                , orgLevel, isActive, notes, website
                , createdOn, createdBy, updatedOn, updatedBy )
    SELECT  orgDepartmentID, name, organizationID, orgLocationID
                , org_level, active, notes, website
                , date_added, createdByID, date_updated, updatedByID
      FROM  @sourceData ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'OrgDepartments INSERTs', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 6
/**/      , @codeBlockDesc  = @codeBlockDesc06 ;  -- INSERT into dbo.OrgDepartmentSystems from temp storage

    INSERT  dbo.OrgDepartmentSystems
          ( ID, systemID, isFERNActive, isMicro, isChem, isRad
                , isSearchable, microAcceptedOn, microWithdrawOn
                , chemAcceptedOn, chemWithdrawOn, radAcceptedOn, radWithdrawOn
                , createdOn, createdBy, updatedOn, updatedBy, mc_org_departmentsID )
    SELECT  orgDepartmentID, systemID, fern_active, micro, chem, rad
                , is_searchable, micro_date_accept, micro_date_withdraw
                , chem_date_accept, chem_date_withdraw, rad_date_accept, rad_date_withdraw
                , date_added, createdByID, date_updated, updatedByID, legacyID
      FROM  @sourceData ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'OrgDepartmentSystems INSERTs', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 7
/**/      , @codeBlockDesc  = @codeBlockDesc07 ;  -- UPDATE parentDepartmentID on dbo.OrgDepartments

      WITH  parents AS (
            SELECT  parentID                = ID
                 ,  mc_org_departmentsID    = mc_org_departmentsID
              FROM  OrgDepartmentSystems AS ogs
             WHERE  systemID = @systemID )

    UPDATE  dbo.OrgDepartments
       SET  parentDepartmentID = prn.parentID
      FROM  @sourceData         AS src
INNER JOIN  dbo.OrgDepartments  AS ods ON ods.id = src.orgDepartmentID
INNER JOIN  parents             AS prn ON prn.mc_org_departmentsID = src.parent_dept_id ;


END TRY
BEGIN CATCH
    SELECT  @errorData = '<b>trigger data passed into coreShield</b></br></br>'
                       + '<table border="1">'
                       + '<tr><th>legacyID</th><th>name</th><th>org_id</th><th>location_id</th>'
                       + '<th>parent_dept_id</th><th>active</th><th>notes</th><th>website</th>'
                       + '<th>org_level</th><th>fern_active</th><th>is_searchable</th><th>micro</th>'
                       + '<th>chem</th><th>rad</th><th>micro_date_accept</th><th>micro_date_withdraw</th>'
                       + '<th>chem_date_accept</th><th>chem_date_withdraw</th><th>rad_date_accept</th>'
                       + '<th>rad_date_withdraw</th><th>date_added</th><th>added_by</th><th>date_updated</th>'
                       + '<th>updated_by</th><th>systemID</th><th>orgDepartmentID</th><th>organizationID</th>'
                       + '<th>orgLocationID</th><th>createdByID</th><th>updatedByID</th></tr>'
                       + CAST ( ( SELECT  td = legacyID, ''
                                       ,  td = name, ''
                                       ,  td = org_id, ''
                                       ,  td = location_id, ''
                                       ,  td = parent_dept_id, ''
                                       ,  td = active, ''
                                       ,  td = notes, ''
                                       ,  td = website, ''
                                       ,  td = org_level, ''
                                       ,  td = fern_active, ''
                                       ,  td = is_searchable, ''
                                       ,  td = micro, ''
                                       ,  td = chem, ''
                                       ,  td = rad, ''
                                       ,  td = micro_date_accept, ''
                                       ,  td = micro_date_withdraw, ''
                                       ,  td = chem_date_accept, ''
                                       ,  td = chem_date_withdraw, ''
                                       ,  td = rad_date_accept, ''
                                       ,  td = rad_date_withdraw, ''
                                       ,  td = date_added, ''
                                       ,  td = added_by, ''
                                       ,  td = date_updated, ''
                                       ,  td = updated_by, ''
                                       ,  td = systemID, ''
                                       ,  td = orgDepartmentID, ''
                                       ,  td = organizationID, ''
                                       ,  td = orgLocationID, ''
                                       ,  td = createdByID, ''
                                       ,  td = updatedByID, ''
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