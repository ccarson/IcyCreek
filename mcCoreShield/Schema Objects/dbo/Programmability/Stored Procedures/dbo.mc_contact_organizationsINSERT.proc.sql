CREATE PROCEDURE [dbo].[mc_contact_organizationsINSERT] ( @systemID     AS INT
                                                    , @recordsIN    AS INT
                                                    , @dataXML      AS XML
                                                    , @errorMessage AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:  dbo.mc_contact_organizationsINSERT
     Author:  Chris Carson
    Purpose:  INSERTs portal view data into dbo.ContactOrganizations and related tables on coreSHIELD

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     ###DATE###      created


    Logic Summary:
    1)  Load temp storage with shredded XML data
    2)  SELECT legacyID for new records
    3)  UPDATE temporary storage with legacyID
    4)  UPDATE temp storage with coreSHIELD related IDs
    5)  UPDATE temporary storage with contactOrganizationID for existing records
    6)  MERGE temporary storage into dbo.ContactOrganizations
    7)  INSERT into dbo.ContactOrgSystems from temp storage

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
          , @codeBlockDesc05    AS NVARCHAR (128)   = 'UPDATE temporary storage with contactOrganizationID for existing records'
          , @codeBlockDesc06    AS NVARCHAR (128)   = 'MERGE temporary storage into dbo.ContactOrganizations'
          , @codeBlockDesc07    AS NVARCHAR (128)   = 'INSERT into dbo.ContactOrgSystems from temp storage' ;

    DECLARE @controlCount       AS INT
          , @controlTotalsError AS NVARCHAR(200)    = N'Control Total Failure:  %s = %d, %s = %d' ;


    DECLARE @legacyID           AS INT = 0 ;

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
                                         , contactOrganizationID    UNIQUEIDENTIFIER    DEFAULT NEWSEQUENTIALID()
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
/**/      , @codeBlockDesc  = @codeBlockDesc02 ; -- SELECT legacyID for new records

    SELECT  @legacyID = COALESCE( MAX( mc_contact_organizationsID ), 0 )
      FROM  dbo.ContactOrgSystems WHERE systemID = @systemID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; -- UPDATE temporary storage with legacyID

    UPDATE  @sourceData
       SET  @legacyID = legacyID = @legacyID + 1
     WHERE  legacyID IS NULL ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ; -- UPDATE temp storage with coreSHIELD related IDs

    UPDATE  @sourceData
       SET  contactID               = cns.ID
          , organizationID          = ogs.ID
          , orgDepartmentID         = ods.ID
          , orgLocationID           = ols.ID
      FROM  @sourceData              AS src
INNER JOIN  dbo.ContactSystems       AS cns ON cns.mc_contactID         = src.user_id     AND cns.systemID = src.systemID
INNER JOIN  dbo.OrganizationSystems  AS ogs ON ogs.mc_organizationID    = src.org_id      AND ogs.systemID = src.systemID
 LEFT JOIN  dbo.OrgDepartmentSystems AS ods ON ods.mc_org_departmentsID = src.org_dept_id AND ods.systemID = src.systemID
 LEFT JOIN  dbo.OrgLocationSystems   AS ols ON ols.mc_org_locationID    = src.location_id AND ols.systemID = src.systemID ;


/**/SELECT  @codeBlockNum   = 5
/**/      , @codeBlockDesc  = @codeBlockDesc05 ; -- UPDATE temporary storage with contactOrganizationID for existing records

    UPDATE  @sourceData
       SET  contactOrganizationID = cog.ID
      FROM  @sourceData              AS src
INNER JOIN  dbo.ContactOrganizations AS cog
        ON  src.contactID       = cog.contactsID
                AND
            src.organizationID  = cog.organizationsID
                AND
        ( ( src.orgDepartmentID = cog.orgDepartmentsID ) OR ( src.orgDepartmentID IS NULL AND cog.orgDepartmentsID IS NULL ) )
                AND
        ( ( src.orgLocationID   = cog.orgLocationsID ) OR ( src.orgLocationID IS NULL AND cog.orgLocationsID IS NULL ) ) ;


/**/SELECT  @codeBlockNum   = 6
/**/      , @codeBlockDesc  = @codeBlockDesc06 ; -- MERGE temporary storage into dbo.ContactOrganizations

     MERGE  dbo.ContactOrganizations    AS tgt
     USING  @sourceData                 AS src ON src.contactOrganizationID = tgt.ID
      WHEN  MATCHED THEN
            UPDATE  SET updatedOn   = src.date_updated
      WHEN  NOT MATCHED BY TARGET THEN
            INSERT  ( ID, contactsID, organizationsID, orgDepartmentsID, orgLocationsID
                        , isDefault, isChosen, isEmergencyContact 
                        , createdOn, updatedOn )
            VALUES  ( src.contactOrganizationID, src.contactID, src.organizationID, src.orgDepartmentID, src.orgLocationID
                        , src.defaultorg, src.chosenorg, src.emergency_contact
                        , src.date_added, src.date_updated ) ; 
    SELECT  @controlCount = @@ROWCOUNT ;

    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'ContactOrganizations MERGE', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 7
/**/      , @codeBlockDesc  = @codeBlockDesc07 ; -- INSERT into dbo.ContactOrgSystems from temp storage

    INSERT  dbo.ContactOrgSystems (
            ID, systemID, createdOn, updatedOn, mc_contact_organizationsID )
    SELECT  contactOrganizationID, systemID, date_added, date_updated, legacyID
      FROM  @sourceData ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'ContactOrgSystems INSERTs', @controlCount ) ;


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