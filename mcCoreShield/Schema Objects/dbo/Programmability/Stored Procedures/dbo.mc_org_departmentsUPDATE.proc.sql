CREATE PROCEDURE dbo.mc_org_departmentsUPDATE ( @systemID       AS INT
                                              , @recordsIN      AS INT
                                              , @dataXML        AS XML
                                              , @errorMessage   AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:  dbo.mc_org_departmentsUPDATE
     Author:  Chris Carson
    Purpose:  UPDATE dbo.OrgDepartments and related tables on coreSHIELD with mc_org_departments data

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2013-03-05      created


    Logic Summary:
    1)  Load temp storage with shredded XML data
    2)  UPDATE temp storage with coreSHIELD related IDs
    3)  UPDATE dbo.OrgDepartments from temp storage
    4)  UPDATE dbo.OrgDepartmentSystems from temp storage

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
          , @codeBlockDesc03    AS NVARCHAR (128)   = 'UPDATE dbo.OrgDepartments from temp storage'
          , @codeBlockDesc04    AS NVARCHAR (128)   = 'UPDATE dbo.OrgDepartmentSystems from temp storage' ;

    DECLARE @controlCount       AS INT
          , @controlTotalsError AS NVARCHAR(200)    = N'Control Total Failure:  %s = %d, %s = %d' ;


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
                                         , orgDepartmentID      UNIQUEIDENTIFIER
                                         , organizationID       UNIQUEIDENTIFIER
                                         , orgLocationID        UNIQUEIDENTIFIER
                                         , parentDepartmentID   UNIQUEIDENTIFIER
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
/**/      , @codeBlockDesc  = @codeBlockDesc02 ; --  UPDATE temp storage with coreSHIELD related IDs

    UPDATE  @sourceData
       SET  orgDepartmentID     = ods.ID
          , parentDepartmentID  = prn.ID
          , organizationID      = ogs.ID
          , orgLocationID       = ols.ID
          , createdByID         = cn1.ID
          , updatedByID         = cn2.ID
      FROM  @sourceData               AS src
INNER JOIN  dbo.OrgDepartmentSystems  AS ods ON ods.mc_org_departmentsID  = src.legacyID        AND ods.systemID = src.systemID
INNER JOIN  dbo.OrganizationSystems   AS ogs ON ogs.mc_organizationID     = src.org_id          AND ogs.systemID = src.systemID
 LEFT JOIN  dbo.OrgDepartmentSystems  AS prn ON prn.mc_org_departmentsID  = src.parent_dept_id  AND ods.systemID = src.systemID
 LEFT JOIN  dbo.OrgLocationSystems    AS ols ON ols.mc_org_locationID     = src.location_id     AND ols.systemID = src.systemID
 LEFT JOIN  dbo.ContactSystems        AS cn1 ON cn1.mc_ContactID          = src.added_by        AND cn1.systemID = src.systemID
 LEFT JOIN  dbo.ContactSystems        AS cn2 ON cn2.mc_ContactID          = src.updated_by      AND cn2.systemID = src.systemID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ;  -- UPDATE dbo.OrgDepartments from temp storage

    UPDATE  dbo.OrgDepartments
       SET  name                = src.Name
          , organizationID      = src.organizationID
          , orgLocationID       = src.orgLocationID
          , parentDepartmentID  = src.parentDepartmentID
          , orgLevel            = src.org_level
          , isActive            = src.active
          , notes               = src.notes
          , website             = src.website
          , createdOn           = src.date_added
          , createdBy           = src.createdByID
          , updatedOn           = src.date_updated
          , updatedBy           = src.updatedByID
      FROM  dbo.OrgDepartments  AS ogd
INNER JOIN  @sourceData         AS src ON src.orgDepartmentID = ogd.ID ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'OrgDepartments UPDATEs', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ;  -- UPDATE dbo.OrgDepartmentSystems from temp storage

    UPDATE  dbo.OrgDepartmentSystems
       SET  isFERNActive    = src.fern_active
          , isMicro         = src.micro
          , isChem          = src.chem
          , isRad           = src.rad
          , isSearchable    = src.is_searchable
          , microAcceptedOn = src.micro_date_accept
          , microWithdrawOn = src.micro_date_withdraw
          , chemAcceptedOn  = src.chem_date_accept
          , chemWithdrawOn  = src.chem_date_withdraw
          , radAcceptedOn   = src.rad_date_accept
          , radWithdrawOn   = src.rad_date_withdraw
          , createdOn       = src.date_added
          , createdBy       = src.createdByID
          , updatedOn       = src.date_updated
          , updatedBy       = src.updatedByID
      FROM  dbo.OrgDepartmentSystems AS ods
INNER JOIN  @sourceData              AS src ON src.orgDepartmentID = ods.ID AND src.systemID = ods.systemID ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'OrgDepartmentSystems UPDATEs', @controlCount ) ;


END TRY
BEGIN CATCH
    SELECT  @errorData = '<b>trigger data passed into coreShield</b></br></br>'
                       + '<table border="1">'
                       + '<tr><th>id</th><th>name</th><th>org_id</th><th>location_id</th>'
                       + '<th>parent_dept_id</th><th>active</th><th>notes</th><th>website</th>'
                       + '<th>org_level</th><th>fern_active</th><th>is_searchable</th><th>micro</th>'
                       + '<th>chem</th><th>rad</th><th>micro_date_accept</th><th>micro_date_withdraw</th>'
                       + '<th>chem_date_accept</th><th>chem_date_withdraw</th><th>rad_date_accept</th>'
                       + '<th>rad_date_withdraw</th><th>date_added</th><th>added_by</th><th>date_updated</th>'
                       + '<th>updated_by</th><th>systemID</th><th>orgDepartmentsID</th><th>organizationID</th>'
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