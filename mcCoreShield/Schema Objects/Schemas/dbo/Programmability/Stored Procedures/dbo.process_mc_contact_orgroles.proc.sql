CREATE PROCEDURE dbo.process_mc_contact_orgroles ( @systemID     AS INT
                                                 , @tableID      AS INT
                                                 , @recordsIN    AS INT
                                                 , @dataXML      AS XML
                                                 , @operation    AS NVARCHAR(20)
                                                 , @errorMessage AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:    dbo.process_mc_contact_orgroles
     Author:    Chris Carson
    Purpose:    Applies portal data to dbo.ContactOrgRoles table on coreSHIELD

    revisor     Version     date            description
    ---------   -------     -----------     ----------------------------
    ccarson     1.0         2010.12-01      created
    ccarson     1.5         2012-09-01      Corrected UPDATE errors, refactored

    Logic Summary:
    @action = INSERT:
        1) Assign new portal.dbo.mc_contact_orgroles.id to incoming records
        2) SELECT incoming trigger data INTO temp storage
        3) INSERT dbo.ContactOrgRoles with data from temp storage
        4) INSERT dbo.transitionIdentities with data from temp storage
    @action = UPDATE:
        5) SELECT incoming trigger data INTO temp storage
        6) UPDATE dbo.ContactOrgRoles with data from temp storage
    @action = DELETE:
        7) SELECT incoming trigger data INTO temp storage
        8) DELETE incoming trigger data FROM dbo.transitionIdentities -- removes from current system
        9) DELETE incoming trigger data FROM dbo.ContactOrgRoles -- removes from all systems if eligible


    Notes:

************************************************************************************************************************************
*/
BEGIN

SET NOCOUNT ON ;

DECLARE @rc                AS INT = 0
      , @newLegacyID       AS INT
      , @rows              AS INT
      , @errorMessageStart AS NVARCHAR(100) ;

IF  @operation = 'INSERT'
    BEGIN

    --  1) Assign new portal.dbo.mc_contact_orgroles.id to incoming records
        CREATE  TABLE #legacyIDs (
                newContactOrgRolesID uniqueidentifier DEFAULT NEWSEQUENTIALID()
              , legacyID             int ) ;

        SELECT  @newLegacyID = ( SELECT COALESCE( MAX( contactOrgRolesID ), 0 )
                                   FROM dbo.vw_transitionContactOrgRoles ) ;

        INSERT  #legacyIDs ( legacyID )
        SELECT  @newLegacyID + ROW_NUMBER() OVER( ORDER BY i.data.value( '@rowID[1]', 'nvarchar(50)' ) )
          FROM  @dataXML.nodes( 'i/data' ) AS i( data ) ;


    --  2) SELECT incoming trigger data INTO temp storage
        SELECT  legacyID      = @newLegacyID +
                                ROW_NUMBER() OVER ( ORDER BY i.data.value( '@rowID[1]', 'nvarchar(50)' ) )
             ,  id            = i.data.value( '@id[1]', 'int' )
             ,  user_id       = i.data.value( '@user_id[1]', 'int' )
             ,  org_id        = i.data.value( '@org_id[1]', 'int' )
             ,  dept_id       = i.data.value( '@dept_id[1]', 'int' )
             ,  role_id       = i.data.value( '@role_id[1]', 'int' )
             ,  is_head       = i.data.value( '@is_head[1]', 'bit' )
             ,  date_added    = i.data.value( '@date_added[1]', 'datetime2' )
             ,  added_by      = i.data.value( '@added_by[1]', 'int' )
             ,  date_modified = i.data.value( '@date_modified[1]', 'datetime2' )
             ,  modified_by   = i.data.value( '@modified_by[1]', 'int' )
          INTO  #inserts
          FROM  @dataXML.nodes( 'i/data' ) AS i( data ) ;


    --  3) INSERT dbo.ContactOrgRoles with data from temp storage
        BEGIN TRY
        INSERT  dbo.ContactOrgRoles (
                id, ContactsID, organizationsID
                    , orgDepartmentsID, rolesID, isHead
                    , dateAdded, addedBy
                    , dateUpdated, updatedBy )
        SELECT  l.newContactOrgRolesID, c1.id, o.id
                    , d.id, r.id, is_head
                    , date_added, c2.id
                    , date_modified, c3.id
          FROM  #inserts   AS i
    INNER JOIN  #legacyIDs AS l ON l.legacyID = i.legacyID
    INNER JOIN  dbo.vw_transitionRoles AS r
            ON  r.RolesID = i.role_id AND r.transitionSystemsID = @systemID
    INNER JOIN  dbo.vw_transitionOrganizations AS o
            ON  o.OrganizationsID =  i.org_id AND o.transitionSystemsID = @systemID
    INNER JOIN  dbo.vw_transitionContacts AS c1
            ON  c1.ContactsID = i.user_id AND c1.transitionSystemsID = @systemID
     LEFT JOIN  dbo.vw_transitionContacts AS c2
            ON  c2.ContactsID = i.added_by AND c2.transitionSystemsID = @systemID
     LEFT JOIN  dbo.vw_transitionContacts AS c3
            ON  c3.ContactsID = i.modified_by AND c3.transitionSystemsID = @systemID
     LEFT JOIN  dbo.vw_transitionOrgDepartments d ON d.orgDepartmentsID = i.dept_id
                AND d.transitionSystemsID = @systemID ;
        SELECT  @rows = @@ROWCOUNT ;
        END TRY
        BEGIN CATCH
            SELECT  @rc = 1 ;
            SELECT  @errorMessageStart = 'INSERT Error returned from ' ;
            GOTO    sqlError ;
        END CATCH

        IF  @rows <> @recordsIN
        BEGIN
            SELECT  @errorMessage = N'INSERT ON dbo.ContactOrgRoles failed!' + CHAR(13) +
                                    N'---Records in         = ' + CAST( @recordsIN AS NVARCHAR(10) ) + CHAR(13) +
                                    N'---Records INSERTed   = ' + CAST( @rows      AS NVARCHAR(10) ) ;
            RETURN  2 ;
        END

    --  4) INSERT dbo.transitionIdentities with data from temp storage
        BEGIN TRY
        INSERT  dbo.transitionIdentities (
                id
              , transitionSystemsID
              , convertedTableID
              , legacyID )
        SELECT  newContactOrgRolesID
              , @systemID
              , @tableID
              , legacyID
          FROM  #legacyIDs ;
        END TRY
        BEGIN CATCH
            SELECT  @rc = 3 ;
            SELECT  @errorMessageStart = 'INSERT Error returned from ' ;
            GOTO    sqlError ;
        END CATCH
    END

IF @operation = 'UPDATE'
    BEGIN


    --  5) SELECT incoming trigger data INTO temp storage
        SELECT  id             = u.data.value('@id[1]' , 'int')
              , user_id        = u.data.value('@user_id[1]' , 'int')
              , org_id         = u.data.value('@org_id[1]' , 'int')
              , dept_id        = u.data.value('@dept_id[1]' , 'int')
              , role_id        = u.data.value('@role_id[1]' , 'int')
              , is_head        = u.data.value('@is_head[1]' , 'bit')
              , date_added     = u.data.value('@date_added[1]' , 'datetime2')
              , added_by       = u.data.value('@added_by[1]' , 'int')
              , date_modified  = u.data.value('@date_modified[1]' , 'datetime2')
              , modified_by    = u.data.value('@modified_by[1]' , 'int')
          INTO  #updates
          FROM  @dataXML.nodes('u/data') AS u(data) ;


    --  6) UPDATE dbo.ContactOrgRoles with data from temp storage
        BEGIN TRY
        UPDATE  dbo.ContactOrgRoles
           SET  contactsID       = c1.id
              , organizationsID  = o.id
              , orgDepartmentsID = d.id
              , rolesID          = r.id
              , isHead           = u.is_head
              , dateAdded        = u.date_added
              , addedBy          = c2.id
              , dateUpdated      = u.date_modified
              , updatedBy        = c3.id
          FROM  dbo.ContactOrgRoles AS cor
    INNER JOIN  dbo.vw_transitionContactOrgRoles AS t
            ON  t.id = cor.id AND t.transitionSystemsID = @systemID
    INNER JOIN  #updates AS u
            ON  u.id = t.ContactOrgRolesID
    INNER JOIN  dbo.vw_transitionContacts AS c1
            ON  c1.contactsID = u.user_id AND c1.transitionSystemsID = @systemID
    INNER JOIN  dbo.vw_transitionRoles AS r
            ON  r.RolesID = u.role_id AND r.transitionSystemsID = @systemID
    INNER JOIN  dbo.vw_transitionOrganizations AS o
            ON  o.OrganizationIDs = u.org_id AND o.transitionSystemsID = @systemID
     LEFT JOIN  dbo.vw_transitionContacts AS c2
            ON  c2.contactsID = u.added_by AND tc2.transitionSystemsID = @systemID
     LEFT JOIN  dbo.vw_transitionContacts AS c3
            ON  tc3.contactsID = u.modified_by AND tc3.transitionSystemsID = @systemID
     LEFT JOIN  dbo.vw_transitionOrgDepartments d
            ON  d.orgDepartmentsID = u.dept_id AND d.transitionSystemsID = @systemID ;
        SELECT  @rows = @@ROWCOUNT ;
        END TRY
        BEGIN CATCH
            SELECT  @rc = 4 ;
            SELECT  @errorMessageStart = 'UPDATE Error returned from ' ;
            GOTO    sqlError ;
        END CATCH

        IF  @rows <> @recordsIN
        BEGIN
            SELECT  @errorMessage = N'UPDATE ON dbo.ContactOrgRoles failed!' +
                                    N'---Records in         = ' + CAST( @recordsIN AS NVARCHAR(10) ) +
                                    N'---Records UPDATEd    = ' + CAST( @rows      AS NVARCHAR(10) ) ;
            RETURN  5 ;
        END
    END

IF  @operation = 'DELETE'
    BEGIN

    --  7) SELECT incoming trigger data INTO temp storage
        SELECT  id     = d.data.value('@id[1]', 'int')
             ,  coreID = CAST( NULL AS UNIQUEIDENTIFIER )
          INTO  #deletes
          FROM  @dataXML.nodes('d/data') AS d(data) ;

        UPDATE  #deletes
           SET  coreID = vc.id
          FROM  #deletes AS d
    INNER JOIN  dbo.vw_transitionContactOrgRoles AS vc
            ON  vc.ContactOrgRolesID = d.id
                AND vc.transitionSystemsID = @systemID ;


    --  8) DELETE incoming trigger data FROM dbo.transitionIdentities -- removes from current system
        BEGIN TRY
        DELETE dbo.vw_transitionContactOrgRoles
          FROM dbo.vw_transitionContactOrgRoles AS a
         WHERE EXISTS ( SELECT 1 FROM #deletes AS d
                         WHERE d.id = a.ContactOrgRolesID
                          AND  a.transitionSystemsID = @systemID ) ;
        SELECT  @rows = @@ROWCOUNT ;
        END TRY
        BEGIN CATCH
            SELECT  @rc = 6 ;
            SELECT  @errorMessageStart = 'DELETE Error returned from ' ;
            GOTO    sqlError ;
        END CATCH

        IF  @rows <> @recordsIN
        BEGIN
            SELECT  @errorMessage = N'DELETE ON dbo.ContactOrgRoles failed!' +
                                    N'---Records in         = ' + CAST( @recordsIN AS NVARCHAR(10) ) +
                                    N'---Records DELETEd    = ' + CAST( @rows      AS NVARCHAR(10) ) ;
            RETURN  7 ;
        END


    --  9) DELETE incoming trigger data FROM dbo.ContactOrgRoles -- removes from all systems if eligible
        BEGIN TRY
        DELETE dbo.ContactOrgRoles
          FROM dbo.ContactOrgRoles AS c
         WHERE EXISTS ( SELECT 1 FROM #deletes AS d
                         WHERE d.coreID = c.id )
           AND NOT EXISTS ( SELECT 1 FROM dbo.transitionIdentities AS i
                             WHERE i.id = c.id ) ;
        END TRY
        BEGIN CATCH
            SELECT  @rc = 8 ;
            SELECT  @errorMessageStart = 'DELETE Error returned from ' ;
            GOTO    sqlError ;
        END CATCH

    END


sqlError:
IF  @rc <> 0
    BEGIN
        SELECT  @errorMessage =
                    @errorMessageStart + ERROR_PROCEDURE() + CHAR(13)
                  + N'    SQL Error Code    = '     + CAST( ERROR_NUMBER() AS NVARCHAR(20) ) + CHAR(13)
                  + N'    SQL Error Message = '     + ERROR_MESSAGE() + CHAR(13) ;
        RETURN  @rc ;
    END

END

