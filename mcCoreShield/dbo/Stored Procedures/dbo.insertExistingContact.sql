CREATE PROCEDURE [dbo].[insertExistingContact] ( @contactID AS UNIQUEIDENTIFIER
                                           , @portalName AS NVARCHAR(20) )
AS
/*
************************************************************************************************************************************

  Procedure:    dbo.insertExistingContact
     Author:    Chris Carson
    Purpose:    Expose existing core Contact on new portal

    revisor     date            description
    ---------   ----------      ---------------------------
    ccarson     ###DATE###      created proc

    Logic Summary
    1)  Validate Input
    2)  SELECT systemID to be inserted into coreShield
    3)  INSERT dbo.ContactSystems record for new portal
    4)  INSERT dbo.transitionIdentities for contactAddresses
    5)  INSERT dbo.transitionIdentities for contactEmails
    6)  INSERT dbo.transitionIdentities for contactNotes
    7)  INSERT dbo.transitionIdentities for contactPhones
    8)  INSERT dbo.transitionIdentities for contactVerifications
    9)  INSERT ContactOrgSystems records for new portal
   10)  INSERT ContactOrgRoleSystems records for new portal
   11)  INSERT OrganizationSystems if required
   12)  INSERT OrgDepartmentSystems if required
   13)  INSERT OrgLocationSystems if required
   14)  INSERT Roles if required


************************************************************************************************************************************
*/
BEGIN
BEGIN TRY
    SET NOCOUNT ON ;

    DECLARE @codeBlockNum       AS INT              = NULL
          , @codeBlockDesc      AS VARCHAR (128)    = NULL
          , @errorData          AS VARCHAR (MAX)    = NULL
          , @errorCount         AS INT              = 0
          , @errorLine          AS INT
          , @errorNumber        AS INT
          , @errorProcedure     AS SYSNAME
          , @errorSeverity      AS INT
          , @errorState         AS INT
          , @errorMessage       AS NVARCHAR(4000)   = NULL ;


    DECLARE @codeBlockDesc01 AS NVARCHAR (128)  = 'Validate Input'
          , @codeBlockDesc02 AS NVARCHAR (128)  = 'SELECT systemID to be inserted into coreShield'
          , @codeBlockDesc03 AS NVARCHAR (128)  = 'INSERT dbo.ContactSystems record for new portal'
          , @codeBlockDesc04 AS NVARCHAR (128)  = 'INSERT dbo.transitionIdentities for contactAddresses'
          , @codeBlockDesc05 AS NVARCHAR (128)  = 'INSERT dbo.transitionIdentities for contactEmails'
          , @codeBlockDesc06 AS NVARCHAR (128)  = 'INSERT dbo.transitionIdentities for contactNotes'
          , @codeBlockDesc07 AS NVARCHAR (128)  = 'INSERT dbo.transitionIdentities for contactPhones'
          , @codeBlockDesc08 AS NVARCHAR (128)  = 'INSERT dbo.transitionIdentities for contactVerifications'
          , @codeBlockDesc09 AS NVARCHAR (128)  = 'INSERT ContactOrgSystems records for new portal'
          , @codeBlockDesc10 AS NVARCHAR (128)  = 'INSERT ContactOrgRoleSystems records for new portal'
          , @codeBlockDesc11 AS NVARCHAR (128)  = 'INSERT OrganizationSystems if required'
          , @codeBlockDesc12 AS NVARCHAR (128)  = 'INSERT OrgDepartmentSystems if required'
          , @codeBlockDesc13 AS NVARCHAR (128)  = 'INSERT OrgLocationSystems if required'
          , @codeBlockDesc14 AS NVARCHAR (128)  = 'INSERT Roles if required' ;


    DECLARE @records            AS TABLE ( organizationsID  UNIQUEIDENTIFIER
                                         , orgDepartmentsID UNIQUEIDENTIFIER
                                         , orgLocationsID   UNIQUEIDENTIFIER
                                         , rolesID          UNIQUEIDENTIFIER ) ;

    DECLARE @systemID           AS INT = 0
          , @recordID           AS INT = 0
          , @convertedTableID   AS INT = 0
          , @utilityID          AS UNIQUEIDENTIFIER = '00000000-0000-0000-0000-000000000000'


/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ; -- Validate Input
    IF  EXISTS ( SELECT 1 FROM Core.mc_contact WHERE contactID = @contactID AND portalName = @portalName )
    BEGIN
        SELECT  @errorMessage  = N'Contact already exists on portal ' + @portalName ;
        RAISERROR ( @errorMessage, 16, 1 ) ;
    END


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc02 ; -- SELECT systemID to be inserted into coreShield

    SELECT  @systemID = ID FROM Reference.Systems WHERE systemName = @portalName ;



/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; -- INSERT dbo.ContactSystems record for new portal

    BEGIN TRANSACTION ;

    SELECT  @recordID = ISNULL( MAX( id ), 0 )
      FROM  Core.mc_contact
     WHERE  portalName = @portalName ;

    INSERT  dbo.ContactSystems (
            ID, systemID, accessID, expiresOn, numberOfHits
                , status, joinedOn, memberType, sysmember, isHidden
                , securityLevel, createdOn, updatedOn, mc_contactID )
    SELECT  TOP 1
            ID, @systemID, AccessID, expiresOn, 0
                , Status, joinedOn, memberType, sysmember, isHidden
                , securityLevel, SYSDATETIME(), SYSDATETIME(), @recordID + 1
      FROM  dbo.ContactSystems AS cs
     WHERE  cs.ID = @contactID ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ; -- INSERT dbo.transitionIdentities for contactAddresses

    SELECT  @convertedTableID = ID FROM dbo.coreConvertedTables WHERE tableName = 'mc_contact_addresses' ;

    SELECT  @recordID = ISNULL( MAX( legacyID ), 0 )
      FROM  dbo.transitionIdentities
     WHERE  convertedTableID = @convertedTableID AND transitionSystemsID = @systemID ;
     
      WITH  records AS ( 
            SELECT DISTINCT ID 
              FROM dbo.ContactAddresses 
             WHERE contactsID = @contactID ) 

    INSERT  dbo.transitionIdentities ( id, transitionSystemsID, convertedTableID, legacyID )
    SELECT  ID
          , @systemID
          , @convertedTableID
          , @recordID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  records ; 


/**/SELECT  @codeBlockNum   = 5
/**/      , @codeBlockDesc  = @codeBlockDesc05 ; -- INSERT dbo.transitionIdentities for contactEmails

    SELECT  @convertedTableID = ID FROM dbo.coreConvertedTables WHERE tableName = 'mc_contact_emails' ;

    SELECT  @recordID = ISNULL( MAX( legacyID ), 0 )
      FROM  dbo.transitionIdentities
     WHERE  convertedTableID = @convertedTableID AND transitionSystemsID = @systemID ;

    INSERT  dbo.transitionIdentities ( id, transitionSystemsID, convertedTableID, legacyID )
    SELECT  ID
          , @systemID
          , @convertedTableID
          , @recordID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  dbo.ContactEmails
     WHERE  contactsID = @contactID ;


/**/SELECT  @codeBlockNum   = 6
/**/      , @codeBlockDesc  = @codeBlockDesc06 ; -- INSERT dbo.transitionIdentities for contactNotes

    SELECT  @convertedTableID = ID FROM dbo.coreConvertedTables WHERE tableName = 'mc_contact_notes' ;

    SELECT  @recordID = ISNULL( MAX( legacyID ), 0 )
      FROM  dbo.transitionIdentities
     WHERE  convertedTableID = @convertedTableID AND transitionSystemsID = @systemID ;

    INSERT  dbo.transitionIdentities ( id, transitionSystemsID, convertedTableID, legacyID )
    SELECT  ID
          , @systemID
          , @convertedTableID
          , @recordID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  dbo.ContactNotes
     WHERE  contactsID = @contactID ;


/**/SELECT  @codeBlockNum   = 7
/**/      , @codeBlockDesc  = @codeBlockDesc07 ; -- INSERT dbo.transitionIdentities for contactPhones

    SELECT  @convertedTableID = ID FROM dbo.coreConvertedTables WHERE tableName = 'mc_contact_phones' ;

    SELECT  @recordID = ISNULL( MAX( legacyID ), 0 )
      FROM  dbo.transitionIdentities
     WHERE  convertedTableID = @convertedTableID AND transitionSystemsID = @systemID ;

    INSERT  dbo.transitionIdentities ( id, transitionSystemsID, convertedTableID, legacyID )
    SELECT  ID
          , @systemID
          , @convertedTableID
          , @recordID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  dbo.ContactPhones
     WHERE  contactsID = @contactID ;


/**/SELECT  @codeBlockNum   = 8
/**/      , @codeBlockDesc  = @codeBlockDesc08 ; -- INSERT dbo.transitionIdentities for contactVerifications

    SELECT  @convertedTableID = ID FROM dbo.coreConvertedTables WHERE tableName = 'mc_contact_verification' ;
	
    SELECT  @recordID = ISNULL( MAX( legacyID ), 0 )
      FROM  dbo.transitionIdentities
     WHERE  convertedTableID = @convertedTableID AND transitionSystemsID = @systemID ;

    INSERT  dbo.transitionIdentities ( id, transitionSystemsID, convertedTableID, legacyID )
    SELECT  ID
          , @systemID
          , @convertedTableID
          , @recordID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  dbo.ContactVerifications
     WHERE  contactsID = @contactID ;


/**/SELECT  @codeBlockNum   = 9
/**/      , @codeBlockDesc  = @codeBlockDesc09 ; -- INSERT ContactOrgSystems records for new portal

    SELECT  @recordID = ISNULL( MAX( id ), 0 )
      FROM  Core.mc_contact_organizations
     WHERE  portalName = @portalName ;

      WITH  records AS (
            SELECT  DISTINCT
                    ID
              FROM  ContactOrganizations
             WHERE  contactsID = @contactID )

    INSERT  dbo.ContactOrgSystems
    SELECT  ID
          , @systemID
          , createdOn   = SYSDATETIME()
          , createdBy   = @utilityID
          , updatedOn   = SYSDATETIME()
          , updatedBy   = @utilityID
          , @recordID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  records ;


/**/SELECT  @codeBlockNum   = 10
/**/      , @codeBlockDesc  = @codeBlockDesc10 ; -- INSERT ContactOrgRoleSystems records for new portal

    SELECT  @recordID = ISNULL( MAX( id ), 0 )
      FROM  Core.mc_contact_orgroles
     WHERE  portalName = @portalName ;
     
      WITH  records AS (
            SELECT  DISTINCT
                    ID
              FROM  ContactOrgRoles
             WHERE  contactsID = @contactID )  

    INSERT  dbo.ContactOrgRoleSystems
    SELECT  ID
          , @systemID
          , SYSDATETIME()
          , @utilityID
          , SYSDATETIME()
          , @utilityID
          , @recordID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  records ; 
      

/**/SELECT  @codeBlockNum   = 11
/**/      , @codeBlockDesc  = @codeBlockDesc11 ; -- INSERT OrganizationSystems if required

    SELECT  @recordID = ISNULL( MAX( id ), 0 ) 
	  FROM	Core.mc_organization 
	 WHERE	portalName = @portalName ;

      WITH  orgs AS (
            SELECT  organizationsID
              FROM  dbo.ContactOrganizations
             WHERE  contactsID = @contactID
                UNION
            SELECT  organizationsID
              FROM  dbo.ContactOrgRoles AS co
             WHERE  contactsID = @contactID ) ,

            records AS (
            SELECT  organizationsID
              FROM  orgs AS o
             WHERE  organizationsID IS NOT NULL
               AND  NOT EXISTS ( SELECT 1 FROM dbo.OrganizationSystems AS s
                                  WHERE s.ID = o.organizationsID AND s.systemID = @systemID ) )

    INSERT  dbo.OrganizationSystems
         (  ID, systemID, organizationTypeID, verticalID
                , createdOn, createdBy, updatedOn, updatedBy
                , mc_organizationID )
    SELECT  organizationsID, @systemID, 0, 0
                , GETDATE(), @utilityID, GETDATE(), @utilityID
                , @recordID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  records ;


/**/SELECT  @codeBlockNum   = 12
/**/      , @codeBlockDesc  = @codeBlockDesc12 ; -- INSERT OrgDepartmentSystems if required

    SELECT  @recordID = ISNULL( MAX( id ), 0 ) 
	  FROM	Core.mc_org_departments 
	 WHERE	portalName = @portalName ;

      WITH  orgDepartments AS (
            SELECT  orgDepartmentsID
              FROM  dbo.ContactOrganizations
             WHERE  contactsID = @contactID
                UNION
            SELECT  orgDepartmentsID
              FROM  dbo.ContactOrgRoles AS co
             WHERE  contactsID = @contactID ) ,

            records AS (
            SELECT  orgDepartmentsID
              FROM  orgDepartments AS o
             WHERE  orgDepartmentsID IS NOT NULL
               AND  NOT EXISTS ( SELECT 1 FROM dbo.OrgDepartmentSystems AS s
                                  WHERE s.ID = o.orgDepartmentsID AND s.systemID = @systemID ) )

    INSERT  dbo.OrgDepartmentSystems
         (  ID, systemID, createdOn, createdBy, updatedOn, updatedBy
                , mc_org_departmentsID )
    SELECT  orgDepartmentsID, @systemID, GETDATE(), @utilityID, GETDATE(), @utilityID
                , @recordID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  records ;


/**/SELECT  @codeBlockNum   = 13
/**/      , @codeBlockDesc  = @codeBlockDesc13 ; -- INSERT OrgLocationSystems if required

    SELECT  @recordID = ISNULL( MAX( id ), 0 ) 
	  FROM	Core.mc_org_location 
	 WHERE	portalName = @portalName ;

      WITH  orgLocations AS (
            SELECT  DISTINCT orgLocationsID
              FROM  dbo.ContactOrganizations AS co
             WHERE  contactsID = @contactID
               AND  orgLocationsID IS NOT NULL
               AND  NOT EXISTS ( SELECT 1 FROM dbo.OrgLocationSystems AS s
                                  WHERE s.ID = co.orgLocationsID AND s.systemID = @systemID ) )

    INSERT  dbo.OrgLocationSystems
         (  ID, systemID, createdOn, createdBy, updatedOn, updatedBy
                , mc_org_locationID )
    SELECT  orgLocationsID, @systemID, GETDATE(), @utilityID, GETDATE(), @utilityID
                , @recordID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  orgLocations ;



/**/SELECT  @codeBlockNum   = 14
/**/      , @codeBlockDesc  = @codeBlockDesc14 ; -- INSERT Roles if required

    SELECT  @convertedTableID = ID FROM dbo.coreConvertedTables WHERE tableName = 'mc_roles' ;

    SELECT  @recordID = ISNULL( MAX( legacyID ), 0 ) 
      FROM  dbo.transitionIdentities
     WHERE  convertedTableID = @convertedTableID AND transitionSystemsID = @systemID ;

      WITH  roles AS (
            SELECT  DISTINCT RolesID
              FROM  dbo.ContactOrgRoles AS co
             WHERE  contactsID = @contactID
               AND  RolesID IS NOT NULL
               AND  NOT EXISTS ( SELECT 1 FROM dbo.transitionIdentities AS s
                                  WHERE s.ID = co.RolesID AND s.transitionSystemsID = @systemID ) )

    INSERT  dbo.transitionIdentities
         (  ID, transitionSystemsID, convertedTableID, legacyID )
    SELECT  rolesID, @systemID, @convertedTableID
                , @recordID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  roles ;

    COMMIT TRANSACTION ;

END TRY
BEGIN CATCH

    ROLLBACK TRANSACTION ;

    SELECT  @errorSeverity  = ERROR_SEVERITY()
          , @errorState     = ERROR_STATE()
          , @errorNumber    = ERROR_NUMBER()
          , @errorLine      = ERROR_LINE()
          , @errorProcedure = ISNULL( ERROR_PROCEDURE(), '-' ) ;

    IF  @errorMessage IS NULL
    BEGIN
        SELECT  @errorMessage = N'Error occurred in Code Block %d, %s ' + CHAR(13) +
                        N'Error %d, Level %d, State %d, Procedure %s, Line %d, Message: ' + ERROR_MESSAGE() ;

        RAISERROR( @errorMessage, @errorSeverity, 1
                 , @codeBlockNum
                 , @codeBlockDesc
                 , @errorNumber
                 , @errorSeverity
                 , @errorState
                 , @errorProcedure
                 , @errorLine ) ;
    END
        ELSE
    BEGIN
        SELECT  @errorSeverity  = ERROR_SEVERITY()
              , @errorState     = ERROR_STATE()

        RAISERROR( @errorMessage, @errorSeverity, @errorState ) ;
    END

    RETURN  @errorSeverity ;

END CATCH

END