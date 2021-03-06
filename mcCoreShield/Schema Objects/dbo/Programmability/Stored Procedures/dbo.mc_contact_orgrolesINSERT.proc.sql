﻿CREATE PROCEDURE [dbo].[mc_contact_orgrolesINSERT] ( @systemID     AS INT
                                               , @recordsIN    AS INT
                                               , @dataXML      AS XML
                                               , @errorMessage AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:  dbo.mc_contact_orgrolesINSERT
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
    5)  INSERT into dbo.Organizations from temp storage with new name field
    6)  UPDATE dbo.Organizations from temp storage with new name field
    7)  INSERT into dbo.OrganizationSystems from temp storage

    NOTES

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
          , @codeBlockDesc05    AS NVARCHAR (128)   = 'UPDATE temporary storage with contactOrgRoleID for existing records'
          , @codeBlockDesc06    AS NVARCHAR (128)   = 'MERGE temporary storage into dbo.ContactOrgRoles'
          , @codeBlockDesc07    AS NVARCHAR (128)   = 'INSERT into dbo.ContactOrgRoleSystems from temp storage' ;

    DECLARE @controlCount       AS INT
          , @controlTotalsError AS NVARCHAR(200)    = N'Control Total Failure:  %s = %d, %s = %d' ;


    DECLARE @legacyID           AS INT = 0 ;

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
                                         , contactOrgRoleID         UNIQUEIDENTIFIER    DEFAULT NEWSEQUENTIALID()
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
/**/      , @codeBlockDesc  = @codeBlockDesc02 ; -- SELECT legacyID for new records

    SELECT  @legacyID = COALESCE( MAX( mc_contact_orgrolesID ), 0 )
      FROM  dbo.ContactOrgRoleSystems WHERE systemID = @systemID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; -- UPDATE temporary storage with legacyID

    UPDATE  @sourceData
       SET  @legacyID = legacyID = @legacyID + 1
     WHERE  legacyID IS NULL ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ; -- UPDATE temp storage with coreSHIELD related IDs

    UPDATE  @sourceData
       SET  contactID           = cn1.ID
          , organizationID      = ogs.ID
          , orgDepartmentID     = ods.ID
          , roleID              = trl.id
          , createdByID         = cn2.ID
          , updatedByID         = cn3.ID
      FROM  @sourceData                 AS src
INNER JOIN  dbo.ContactSystems          AS cn1 ON cn1.mc_contactID          = src.user_id     AND cn1.systemID = src.systemID
INNER JOIN  dbo.OrganizationSystems     AS ogs ON ogs.mc_organizationID     = src.org_id      AND ogs.systemID = src.systemID
INNER JOIN  dbo.vw_transitionRoles      AS trl ON trl.RolesID = src.role_id AND trl.transitionSystemsID = src.systemID
 LEFT JOIN  dbo.OrgDepartmentSystems    AS ods ON ods.mc_org_departmentsID  = src.dept_id     AND ods.systemID = src.systemID
 LEFT JOIN  dbo.ContactSystems          AS cn2 ON cn2.mc_contactID          = src.added_by    AND cn2.systemID = src.systemID
 LEFT JOIN  dbo.ContactSystems          AS cn3 ON cn3.mc_contactID          = src.modified_by AND cn3.systemID = src.systemID ;


/**/SELECT  @codeBlockNum   = 5
/**/      , @codeBlockDesc  = @codeBlockDesc05 ; -- UPDATE temporary storage with contactOrgRoleID for existing records

    UPDATE  @sourceData
       SET  contactOrgRoleID = cor.ID
      FROM  @sourceData         AS src
INNER JOIN  dbo.ContactOrgRoles AS cor
        ON  src.contactID       = cor.contactsID
                AND
            src.organizationID  = cor.organizationsID
                AND
            src.roleID          = cor.rolesID
                AND
        ( ( src.orgDepartmentID = cor.orgDepartmentsID ) OR ( src.orgDepartmentID IS NULL AND cor.orgDepartmentsID IS NULL ) ) ;


/**/SELECT  @codeBlockNum   = 6
/**/      , @codeBlockDesc  = @codeBlockDesc06 ; -- MERGE temporary storage into dbo.ContactOrgRoles

     MERGE  dbo.ContactOrgRoles AS tgt
     USING  @sourceData         AS src ON src.contactOrgRoleID = tgt.ID
      WHEN  MATCHED THEN
            UPDATE  SET isHead      = src.is_head
                      , createdOn   = src.date_added
                      , createdBy   = src.createdByID
                      , updatedOn   = src.date_modified
                      , updatedBy   = src.updatedByID
      WHEN  NOT MATCHED BY TARGET THEN
            INSERT  ( ID, contactsID, organizationsID, orgDepartmentsID, rolesID
                        , isHead, createdOn, createdBy, updatedOn, updatedBy )
            VALUES  ( src.contactOrgRoleID, src.contactID, src.organizationID, src.orgDepartmentID, src.RoleID
                        , src.is_head, src.date_added, src.createdByID, src.date_modified, src.updatedByID ) ;
    SELECT  @controlCount = @@ROWCOUNT ;

    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'ContactOrgRoles MERGE', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 7
/**/      , @codeBlockDesc  = @codeBlockDesc07 ; -- INSERT into dbo.ContactOrgRoleSystems from temp storage

    INSERT  dbo.ContactOrgRoleSystems (
            ID, systemID, createdOn, createdBy, updatedOn, updatedBy, mc_contact_orgrolesID )
    SELECT  contactOrgRoleID, systemID, date_added, createdByID, date_modified, updatedByID, legacyID
      FROM  @sourceData ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'ContactOrgRoleSystems INSERTs', @controlCount ) ;


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