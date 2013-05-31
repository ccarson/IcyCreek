CREATE PROCEDURE [dbo].[mc_contact_orgrolesUPDATE] ( @systemID     AS INT
                                               , @recordsIN    AS INT
                                               , @dataXML      AS XML
                                               , @errorMessage AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:  dbo.mc_contact_orgrolesUPDATE
     Author:  Chris Carson
    Purpose:  UPDATEs portal view data for dbo.ContactOrgLocations and related tables on coreSHIELD

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     ###DATE###      created


    Logic Summary:
    1)  Load temp storage with shredded XML data
    2)  UPDATE temp storage with coreSHIELD related IDs
    3)  UPDATE dbo.ContactOrgRoles from temp storage
    4)  UPDATE dbo.ContactOrgRoleSystems from temp storage


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
          , @codeBlockDesc03    AS NVARCHAR (128)   = 'UPDATE dbo.ContactOrgRoles from temp storage'
          , @codeBlockDesc04    AS NVARCHAR (128)   = 'UPDATE dbo.ContactOrgRoleSystems from temp storage' ;

    DECLARE @controlCount       AS INT
          , @controlTotalsError AS NVARCHAR(200)    = N'Control Total Failure:  %s = %d, %s = %d' ;


    DECLARE @sourceData         AS TABLE ( legacyID                 INT
                                         , user_id                  INT
                                         , org_id                   INT
                                         , dept_id                  INT
                                         , role_id                  INT
                                         , is_head                  BIT
                                         , date_added               DATETIME2 (7)
                                         , added_by                 INT
                                         , date_modified            DATETIME2 (7)
                                         , modified_by              INT
                                         , systemID                 INT
                                         , contactOrgRoleID         UNIQUEIDENTIFIER
                                         , contactID                UNIQUEIDENTIFIER
                                         , organizationID           UNIQUEIDENTIFIER
                                         , orgDepartmentID          UNIQUEIDENTIFIER
                                         , roleID                   UNIQUEIDENTIFIER
                                         , createdByID              UNIQUEIDENTIFIER
                                         , updatedByID              UNIQUEIDENTIFIER ) ;


/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ; -- Load temp storage with shredded XML data

    INSERT  @sourceData
          ( legacyID
          , user_id
          , org_id
          , dept_id
          , role_id
          , is_head
          , date_added
          , added_by
          , date_modified
          , modified_by
          , systemID )
    SELECT  row.data.value( '@id[1]',               'int' )
          , row.data.value( '@user_id[1]',          'int' )
          , row.data.value( '@org_id[1]',           'int' )
          , row.data.value( '@dept_id[1]',          'int' )
          , row.data.value( '@role_id[1]',          'int' )
          , row.data.value( '@is_head[1]',          'bit' )
          , row.data.value( '@date_added[1]',       'datetime2' )
          , row.data.value( '@added_by[1]',         'int' )
          , row.data.value( '@date_modified[1]',    'datetime2' )
          , row.data.value( '@modified_by[1]',      'int' )
          , @systemID
      FROM  @dataXML.nodes( 'row/data' ) AS row( data ) ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, '@dataXML INSERT', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc02 ; --  UPDATE temp storage with coreSHIELD related IDs

    UPDATE  @sourceData
       SET  contactOrgRoleID    = crs.ID
          , contactID           = cn1.ID
          , organizationID      = ogs.ID
          , orgDepartmentID     = ods.ID
          , roleID              = trl.id
          , createdByID         = cn2.ID
          , updatedByID         = cn3.ID
      FROM  @sourceData                 AS src
INNER JOIN  dbo.ContactOrgRoleSystems   AS crs ON crs.mc_contact_orgrolesID = src.legacyID    AND crs.systemID = src.systemID
INNER JOIN  dbo.ContactSystems          AS cn1 ON cn1.mc_contactID          = src.user_id     AND cn1.systemID = src.systemID
INNER JOIN  dbo.OrganizationSystems     AS ogs ON ogs.mc_organizationID     = src.org_id      AND ogs.systemID = src.systemID
INNER JOIN  dbo.vw_transitionRoles      AS trl ON trl.RolesID = src.role_id AND trl.transitionSystemsID = src.systemID
 LEFT JOIN  dbo.OrgDepartmentSystems    AS ods ON ods.mc_org_departmentsID  = src.dept_id     AND ods.systemID = src.systemID
 LEFT JOIN  dbo.ContactSystems          AS cn2 ON cn2.mc_contactID          = src.added_by    AND cn2.systemID = src.systemID
 LEFT JOIN  dbo.ContactSystems          AS cn3 ON cn3.mc_contactID          = src.modified_by AND cn3.systemID = src.systemID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; --  UPDATE dbo.ContactOrgRoles from temp storage

    UPDATE  dbo.ContactOrgRoles
       SET  contactsID          = src.contactID
          , organizationsID     = src.organizationID
          , orgDepartmentsID    = src.orgDepartmentID
          , rolesID             = src.roleID
          , isHead              = src.is_head
          , createdOn           = src.date_added
          , createdBy           = src.createdByID
          , updatedOn           = src.date_modified
          , updatedBy           = src.updatedByID
      FROM  dbo.ContactOrgRoles AS cor
INNER JOIN  @sourceData         AS src ON src.contactOrgRoleID = cor.ID ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'ContactOrgRoles UPDATEs', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ; --  UPDATE dbo.OrgLocationSystems from temp storage

    UPDATE  dbo.ContactOrgRoleSystems
       SET  createdOn   = src.date_added
          , createdBy   = src.createdByID 
          , updatedOn   = src.date_modified
          , updatedBy   = src.updatedByID
      FROM  dbo.ContactOrgRoleSystems   AS crs
INNER JOIN  @sourceData                 AS src ON src.contactOrgRoleID = crs.ID AND src.systemID = crs.systemID ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'ContactOrgRoleSystems UPDATEs', @controlCount ) ;


END TRY
BEGIN CATCH
    SELECT  @errorData = '<b>trigger data passed into coreShield</b></br></br>'
                       + '<table border="1">'
                       + '<tr><th>legacyID</th><th>user_id</th><th>org_id</th><th>dept_id</th>'
                       + '<th>role_id</th><th>is_head</th><th>date_added</th><th>added_by</th>'
                       + '<th>date_modified</th><th>modified_by</th></tr>'
                       + CAST ( ( SELECT  td = legacyID, ''
                                        , td = user_id, ''
                                        , td = org_id, ''
                                        , td = dept_id, ''
                                        , td = role_id, ''
                                        , td = is_head, ''
                                        , td = date_added, ''
                                        , td = added_by, ''
                                        , td = date_modified, ''
                                        , td = modified_by, ''
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