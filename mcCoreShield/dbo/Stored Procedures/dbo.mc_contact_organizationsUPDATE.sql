CREATE PROCEDURE [dbo].[mc_contact_organizationsUPDATE] ( @systemID     AS INT
                                                    , @recordsIN    AS INT
                                                    , @dataXML      AS XML
                                                    , @errorMessage AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:  dbo.mc_contact_organizationsUPDATE
     Author:  Chris Carson
    Purpose:  UPDATEs portal view data for dbo.ContactOrgLocations and related tables on coreSHIELD

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     ###DATE###      created


    Logic Summary:
    1)  Load temp storage with shredded XML data
    2)  UPDATE temp storage with coreSHIELD related IDs
    3)  UPDATE dbo.ContactOrganizations from temp storage
    4)  UPDATE dbo.ContactOrgSystems from temp storage


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
          , @codeBlockDesc03    AS NVARCHAR (128)   = 'UPDATE dbo.ContactOrganizations from temp storage'
          , @codeBlockDesc04    AS NVARCHAR (128)   = 'UPDATE dbo.ContactOrgSystems from temp storage' ;

    DECLARE @controlCount       AS INT
          , @controlTotalsError AS NVARCHAR(200)    = N'Control Total Failure:  %s = %d, %s = %d' ;


    DECLARE @sourceData         AS TABLE ( legacyID                 INT
                                         , user_id                  INT
                                         , org_id                   INT
                                         , org_dept_id              INT
                                         , location_id              INT
                                         , defaultorg               BIT
                                         , chosenorg                BIT
                                         , emergency_contact        BIT
                                         , date_added               DATETIME2 (7)
                                         , date_updated             DATETIME2 (7)
                                         , systemID                 INT
                                         , contactOrganizationID    UNIQUEIDENTIFIER
                                         , contactID                UNIQUEIDENTIFIER
                                         , organizationID           UNIQUEIDENTIFIER
                                         , orgDepartmentID          UNIQUEIDENTIFIER
                                         , orgLocationID            UNIQUEIDENTIFIER ) ;


/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ; -- Load temp storage with shredded XML data

    INSERT  @sourceData
          ( legacyID
          , user_id
          , org_id
          , org_dept_id
          , location_id
          , defaultorg
          , chosenorg
          , emergency_contact
          , date_added
          , date_updated
          , systemID )
    SELECT  row.data.value( '@id[1]',                'int' )
          , row.data.value( '@user_id[1]',           'int' )
          , row.data.value( '@org_id[1]',            'int' )
          , row.data.value( '@org_dept_id[1]',       'int' )
          , row.data.value( '@location_id[1]',       'int' )
          , row.data.value( '@defaultorg[1]',        'bit' )
          , row.data.value( '@chosenorg[1]',         'bit' )
          , row.data.value( '@emergency_contact[1]', 'bit' )
          , row.data.value( '@date_added[1]',        'datetime2' )
          , row.data.value( '@date_updated[1]',      'datetime2' )
          , @systemID
      FROM  @dataXML.nodes( 'row/data' ) AS row( data ) ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, '@dataXML INSERT', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc02 ; --  UPDATE temp storage with coreSHIELD related IDs

    UPDATE  @sourceData
       SET  contactOrganizationID   = cgs.ID
          , contactID               = cns.ID
          , organizationID          = ogs.ID
          , orgDepartmentID         = ods.ID
          , orgLocationID           = ols.ID
      FROM  @sourceData              AS src
INNER JOIN  dbo.ContactOrgSystems    AS cgs ON cgs.mc_contact_organizationsID = src.legacyID    AND cgs.systemID = src.systemID
INNER JOIN  dbo.ContactSystems       AS cns ON cns.mc_contactID               = src.user_id     AND cns.systemID = src.systemID
INNER JOIN  dbo.OrganizationSystems  AS ogs ON ogs.mc_organizationID          = src.org_id      AND ogs.systemID = src.systemID
 LEFT JOIN  dbo.OrgDepartmentSystems AS ods ON ods.mc_org_departmentsID       = src.org_dept_id AND ods.systemID = src.systemID
 LEFT JOIN  dbo.OrgLocationSystems   AS ols ON ols.mc_org_locationID          = src.location_id AND ols.systemID = src.systemID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; --  UPDATE dbo.ContactOrganizations from temp storage

    UPDATE  dbo.ContactOrganizations
       SET  contactsID          = src.contactID
          , organizationsID     = src.organizationID
          , orgDepartmentsID    = src.orgDepartmentID
          , orgLocationsID      = src.orgLocationID
          , isDefault           = src.defaultorg
          , isChosen            = src.chosenorg
          , isEmergencyContact  = src.emergency_contact
          , createdOn           = src.date_added
          , updatedOn           = src.date_updated
      FROM  dbo.ContactOrganizations AS cog
INNER JOIN  @sourceData              AS src ON src.contactOrganizationID = cog.ID ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'ContactOrganization UPDATEs', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ; --  UPDATE dbo.ContactOrgSystems from temp storage

    UPDATE  dbo.ContactOrgSystems
       SET  createdOn          = src.date_added
          , updatedOn          = src.date_updated
      FROM  dbo.ContactOrgSystems   AS cgs
INNER JOIN  @sourceData             AS src ON src.contactOrganizationID = cgs.ID AND cgs.systemID = src.systemID ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'ContactOrgSystems UPDATEs', @controlCount ) ;

        
END TRY
BEGIN CATCH
    SELECT  @errorData = '<b>trigger data passed into coreShield</b></br></br>'
                       + '<table border="1">'
                       + '<tr><th>legacyID</th><th>user_id</th><th>org_id</th><th>org_dept_id</th>'
                       + '<th>location_id</th><th>defaultorg</th><th>chosenorg</th><th>emergency_contact</th>'
                       + '<th>date_added</th><th>date_updated</th></tr>'
                       + CAST ( ( SELECT  td = legacyID, ''
                                        , td = user_id, ''
                                        , td = org_id, ''
                                        , td = org_dept_id, ''
                                        , td = location_id, ''
                                        , td = defaultorg, ''
                                        , td = chosenorg, ''
                                        , td = emergency_contact, ''
                                        , td = date_added, ''
                                        , td = date_updated, '' 
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