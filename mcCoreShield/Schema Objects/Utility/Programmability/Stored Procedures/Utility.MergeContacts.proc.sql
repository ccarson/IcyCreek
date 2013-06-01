CREATE PROCEDURE Utility.MergeContacts ( @MasterContactID       AS UNIQUEIDENTIFIER
                                       , @MasterPortalName      AS NVARCHAR (20)
                                       , @MergingContactID      AS UNIQUEIDENTIFIER )
AS
/*
************************************************************************************************************************************

  Procedure:    Utility.MergeContacts
     Author:    Chris Carson
    Purpose:    Merges two coreShield Contacts

    revisor     date            description
    ---------   ----------      ---------------------------
    ccarson     2013-03-05      created proc

    Logic Summary:
    1)  Validate Input
    2)  EXECUTE process to merge ContactAddresses between @MasterContactID and @MergingContactID
    3)  EXECUTE process to merge ContactEmails between @MasterContactID and @MergingContactID
    4)  EXECUTE process to merge ContactNotes between @MasterContactID and @MergingContactID
    5)  EXECUTE process to merge ContactPhones between @MasterContactID and @MergingContactID
    6)  EXECUTE process to merge ContactOrganizations between @MasterContactID and @MergingContactID
    7)  EXECUTE process to merge ContactOrgRoles between @MasterContactID and @MergingContactID
    8)  EXECUTE process to merge ContactVerifications between @MasterContactID and @MergingContactID
    9)  UPDATE dbo.ContactSystems.ID with @masterContactID
   10)  UPDATE dbo.contactMeetings.sCoreUserUD
   11)  UPDATE dbo.ContactOrganizations.createdBy
   12)  UPDATE dbo.ContactOrganizations.updatedBy
   13)  UPDATE dbo.ContactOrgSystems.createdBy
   14)  UPDATE dbo.ContactOrgSystems.updatedBy
   15)  UPDATE dbo.ContactOrganizations.createdBy
   16)  UPDATE dbo.ContactOrganizations.updatedBy
   17)  UPDATE dbo.ContactOrgSystems.createdBy
   18)  UPDATE dbo.ContactOrgSystems.updatedBy
   19)  UPDATE dbo.ContactNotes.adminID, replacing @MergingContactID with @MasterContactID
   20)  UPDATE dbo.Contacts.createdBy, replacing @MergingContactID with @MasterContactID
   21)  UPDATE dbo.Contacts.updatedBy, replacing @MergingContactID with @MasterContactID
   22)  UPDATE dbo.Contacts.verifiedBy, replacing @MergingContactID with @MasterContactID
   23)  UPDATE dbo.ContactSystems.createdBy, replacing @MergingContactID with @MasterContactID
   24)  UPDATE dbo.ContactSystems.updatedBy, replacing @MergingContactID with @MasterContactID
   25)  UPDATE dbo.Organizations.createdBy
   26)  UPDATE dbo.Organizations.updatedBy
   27)  UPDATE dbo.OrganizationSystems.createdBy
   28)  UPDATE dbo.OrganizationSystems.updatedBy
   29)  UPDATE dbo.OrgDepartments.createdBy
   30)  UPDATE dbo.OrgDepartments.updatedBy
   31)  UPDATE dbo.OrgDepartmentSystems.createdBy
   32)  UPDATE dbo.OrgDepartmentSystems.updatedBy
   33)  UPDATE dbo.OrgLocations.createdBy
   34)  UPDATE dbo.OrgLocations.updatedBy
   35)  UPDATE dbo.OrgLocationSystems.createdBy
   36)  UPDATE dbo.OrgLocationSystems.updatedBy
   37)  UPDATE dbo.Contact, denoting merge ;

    NOTES

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


    DECLARE @masterPortals      AS TABLE ( systemID INT ) ;

    DECLARE @mergingPortals     AS TABLE ( systemID INT ) ;

    DECLARE @codeBlockDesc01    AS NVARCHAR (128) = 'Validate Input'
          , @codeBlockDesc02    AS NVARCHAR (128) = 'EXECUTE process to merge ContactAddresses between @MasterContactID and @MergingContactID '
          , @codeBlockDesc03    AS NVARCHAR (128) = 'EXECUTE process to merge ContactEmails between @MasterContactID and @MergingContactID '
          , @codeBlockDesc04    AS NVARCHAR (128) = 'EXECUTE process to merge ContactNotes between @MasterContactID and @MergingContactID '
          , @codeBlockDesc05    AS NVARCHAR (128) = 'EXECUTE process to merge ContactPhones between @MasterContactID and @MergingContactID '
          , @codeBlockDesc06    AS NVARCHAR (128) = 'EXECUTE process to merge ContactOrganizations between @MasterContactID and @MergingContactID '
          , @codeBlockDesc07    AS NVARCHAR (128) = 'EXECUTE process to merge ContactOrgRoles between @MasterContactID and @MergingContactID '
          , @codeBlockDesc08    AS NVARCHAR (128) = 'EXECUTE process to merge ContactVerifications between @MasterContactID and @MergingContactID '
          , @codeBlockDesc09    AS NVARCHAR (128) = 'UPDATE dbo.ContactSystems.ID with @masterContactID '
          , @codeBlockDesc10    AS NVARCHAR (128) = 'UPDATE dbo.contactMeetings.sCoreUserUD '
          , @codeBlockDesc11    AS NVARCHAR (128) = 'UPDATE dbo.ContactOrganizations.createdBy'
          , @codeBlockDesc12    AS NVARCHAR (128) = 'UPDATE dbo.ContactOrganizations.updatedBy'
          , @codeBlockDesc13    AS NVARCHAR (128) = 'UPDATE dbo.ContactOrgSystems.createdBy'
          , @codeBlockDesc14    AS NVARCHAR (128) = 'UPDATE dbo.ContactOrgSystems.updatedBy'
          , @codeBlockDesc15    AS NVARCHAR (128) = 'UPDATE dbo.ContactOrganizations.createdBy'
          , @codeBlockDesc16    AS NVARCHAR (128) = 'UPDATE dbo.ContactOrganizations.updatedBy'
          , @codeBlockDesc17    AS NVARCHAR (128) = 'UPDATE dbo.ContactOrgSystems.createdBy'
          , @codeBlockDesc18    AS NVARCHAR (128) = 'UPDATE dbo.ContactOrgSystems.updatedBy'
          , @codeBlockDesc19    AS NVARCHAR (128) = 'UPDATE dbo.ContactNotes.adminID, replacing @MergingContactID with @MasterContactID'
          , @codeBlockDesc20    AS NVARCHAR (128) = 'UPDATE dbo.Contacts.createdBy, replacing @MergingContactID with @MasterContactID '
          , @codeBlockDesc21    AS NVARCHAR (128) = 'UPDATE dbo.Contacts.updatedBy, replacing @MergingContactID with @MasterContactID '
          , @codeBlockDesc22    AS NVARCHAR (128) = 'UPDATE dbo.Contacts.verifiedBy, replacing @MergingContactID with @MasterContactID '
          , @codeBlockDesc23    AS NVARCHAR (128) = 'UPDATE dbo.ContactSystems.createdBy, replacing @MergingContactID with @MasterContactID '
          , @codeBlockDesc24    AS NVARCHAR (128) = 'UPDATE dbo.ContactSystems.updatedBy, replacing @MergingContactID with @MasterContactID '
          , @codeBlockDesc25    AS NVARCHAR (128) = 'UPDATE dbo.Organizations.createdBy'
          , @codeBlockDesc26    AS NVARCHAR (128) = 'UPDATE dbo.Organizations.updatedBy'
          , @codeBlockDesc27    AS NVARCHAR (128) = 'UPDATE dbo.OrganizationSystems.createdBy'
          , @codeBlockDesc28    AS NVARCHAR (128) = 'UPDATE dbo.OrganizationSystems.updatedBy'
          , @codeBlockDesc29    AS NVARCHAR (128) = 'UPDATE dbo.OrgDepartments.createdBy'
          , @codeBlockDesc30    AS NVARCHAR (128) = 'UPDATE dbo.OrgDepartments.updatedBy'
          , @codeBlockDesc31    AS NVARCHAR (128) = 'UPDATE dbo.OrgDepartmentSystems.createdBy'
          , @codeBlockDesc32    AS NVARCHAR (128) = 'UPDATE dbo.OrgDepartmentSystems.updatedBy'
          , @codeBlockDesc33    AS NVARCHAR (128) = 'UPDATE dbo.OrgLocations.createdBy'
          , @codeBlockDesc34    AS NVARCHAR (128) = 'UPDATE dbo.OrgLocations.updatedBy'
          , @codeBlockDesc35    AS NVARCHAR (128) = 'UPDATE dbo.OrgLocationSystems.createdBy'
          , @codeBlockDesc36    AS NVARCHAR (128) = 'UPDATE dbo.OrgLocationSystems.updatedBy'
          , @codeBlockDesc37    AS NVARCHAR (128) = 'UPDATE dbo.Contact, denoting merge' ;


/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ; --  Validate Input
    IF  NOT EXISTS ( SELECT 1 FROM Core.mc_contact WHERE contactID = @MasterContactID AND portalName = @MasterPortalName )
    BEGIN
        SELECT  @errorMessage  = N'Master Contact does not exist on portal ' + @MasterPortalName ;
        RAISERROR ( @errorMessage, 16, 1 ) ;
    END

    IF  NOT EXISTS ( SELECT 1 FROM Core.mc_contact WHERE contactID = @MergingContactID )
    BEGIN
        SELECT  @errorMessage  = N'Merging Contact does not exist' + CAST( @MergingContactID AS VARCHAR(50) ) ;
        RAISERROR ( @errorMessage, 16, 2 ) ;
    END

    INSERT  @masterPortals ( systemID )
    SELECT  systemID FROM dbo.ContactSystems WHERE ID = @MasterContactID ;

    INSERT  @mergingPortals ( systemID )
    SELECT  systemID FROM dbo.ContactSystems WHERE ID = @MergingContactID ;

    IF  EXISTS ( SELECT 1 FROM @masterPortals  AS a
                    INNER JOIN @mergingPortals AS b ON b.systemID = a.systemID )
    BEGIN
        SELECT  @errorMessage  = N'The selected contacts could not be merged -- common portals ' + CAST( @MergingContactID AS NVARCHAR(50) ) ;
        RAISERROR ( @errorMessage , 16, 3 ) ;
    END


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc02 ; --  EXECUTE process to merge ContactAddresses between @MasterContactID and @MergingContactID
    EXECUTE Utility.MergeContactAddresses   @MasterContactID    = @MasterContactID
                                          , @MergingContactID   = @MergingContactID
                                          , @errorMessage       = @errorMessage OUTPUT ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; --  EXECUTE process to merge ContactEmails between @MasterContactID and @MergingContactID
    EXECUTE Utility.MergeContactEmails      @MasterContactID    = @MasterContactID
                                          , @MergingContactID   = @MergingContactID
                                          , @errorMessage       = @errorMessage OUTPUT ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ; --  EXECUTE process to merge ContactNotes between @MasterContactID and @MergingContactID
    EXECUTE Utility.MergeContactNotes       @MasterContactID    = @MasterContactID
                                          , @MergingContactID   = @MergingContactID
                                          , @errorMessage       = @errorMessage OUTPUT ;


/**/SELECT  @codeBlockNum   = 5
/**/      , @codeBlockDesc  = @codeBlockDesc05 ; --  EXECUTE process to merge ContactPhones between @MasterContactID and @MergingContactID
    EXECUTE Utility.MergeContactPhones      @MasterContactID    = @MasterContactID
                                          , @MergingContactID   = @MergingContactID
                                          , @errorMessage       = @errorMessage OUTPUT ;


/**/SELECT  @codeBlockNum   = 6
/**/      , @codeBlockDesc  = @codeBlockDesc06 ; --  EXECUTE process to merge ContactOrganizations between @MasterContactID and @MergingContactID
    EXECUTE Utility.MergeContactOrganizations      @MasterContactID    = @MasterContactID
                                                 , @MergingContactID   = @MergingContactID
                                                 , @errorMessage       = @errorMessage OUTPUT ;


/**/SELECT  @codeBlockNum   = 7
/**/      , @codeBlockDesc  = @codeBlockDesc07 ; --  EXECUTE process to merge ContactOrgRoles between @MasterContactID and @MergingContactID
    EXECUTE Utility.MergeContactOrgRoles      @MasterContactID    = @MasterContactID
                                            , @MergingContactID   = @MergingContactID
                                            , @errorMessage       = @errorMessage OUTPUT ;


/**/SELECT  @codeBlockNum   = 8
/**/      , @codeBlockDesc  = @codeBlockDesc08 ; --  EXECUTE process to merge ContactVerifications between @MasterContactID and @MergingContactID
    EXECUTE Utility.MergeContactVerifications      @MasterContactID    = @MasterContactID
                                                 , @MergingContactID   = @MergingContactID
                                                 , @errorMessage       = @errorMessage OUTPUT ;


/**/SELECT  @codeBlockNum   = 9
/**/      , @codeBlockDesc  = @codeBlockDesc09 ; --  UPDATE dbo.ContactSystems.ID with @masterContactID
    UPDATE  dbo.ContactSystems
       SET  ID          = @MasterContactID
          , updatedOn   = GETDATE()
          , updatedBy   = '00000000-0000-0000-0000-000000000000'
      FROM  dbo.ContactSystems  AS cns
     WHERE  ID = @MergingContactID ;


/**/SELECT  @codeBlockNum   = 10
/**/      , @codeBlockDesc  = @codeBlockDesc10 ; --  UPDATE dbo.contactMeetings.sCoreUserUD
    UPDATE  dbo.contactMeetings
       SET  sCoreUserID = @MasterContactID
      FROM  dbo.contactMeetings  AS c
     WHERE  sCoreUserID = @MergingContactID ;


/**/SELECT  @codeBlockNum   = 11
/**/      , @codeBlockDesc  = @codeBlockDesc11 ; --  UPDATE dbo.ContactOrganizations.createdBy
    UPDATE  dbo.ContactOrganizations
       SET  createdBy = @MasterContactID
     WHERE  createdBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 12
/**/      , @codeBlockDesc  = @codeBlockDesc12 ; --  UPDATE dbo.ContactOrganizations.updatedBy
    UPDATE  dbo.ContactOrganizations
       SET  updatedBy = @MasterContactID
     WHERE  updatedBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 13
/**/      , @codeBlockDesc  = @codeBlockDesc13 ; --  UPDATE dbo.ContactOrgSystems.createdBy
    UPDATE  dbo.ContactOrgSystems
       SET  createdBy = @MasterContactID
     WHERE  createdBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 14
/**/      , @codeBlockDesc  = @codeBlockDesc14 ; --  UPDATE dbo.ContactOrgSystems.updatedBy
    UPDATE  dbo.ContactOrgSystems
       SET  updatedBy = @MasterContactID
     WHERE  updatedBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 15
/**/      , @codeBlockDesc  = @codeBlockDesc15 ; --  UPDATE dbo.ContactOrganizations.createdBy
    UPDATE  dbo.ContactOrgRoles
       SET  createdBy = @MasterContactID
     WHERE  createdBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 16
/**/      , @codeBlockDesc  = @codeBlockDesc16 ; --  UPDATE dbo.ContactOrganizations.updatedBy
    UPDATE  dbo.ContactOrgRoles
       SET  updatedBy = @MasterContactID
     WHERE  updatedBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 17
/**/      , @codeBlockDesc  = @codeBlockDesc17 ; --  UPDATE dbo.ContactOrgSystems.createdBy
    UPDATE  dbo.ContactOrgRoleSystems
       SET  createdBy = @MasterContactID
     WHERE  createdBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 18
/**/      , @codeBlockDesc  = @codeBlockDesc18 ; --  UPDATE dbo.ContactOrgSystems.updatedBy
    UPDATE  dbo.ContactOrgRoleSystems
       SET  updatedBy = @MasterContactID
     WHERE  updatedBy = @MergingContactID ;


/**/SELECT  @codeBlockNum   = 19
/**/      , @codeBlockDesc  = @codeBlockDesc19 ; --  UPDATE dbo.ContactNotes.adminID, replacing @MergingContactID with @MasterContactID
    UPDATE  dbo.ContactNotes
       SET  adminID = @MasterContactID
     WHERE  adminID = @MergingContactID ;


/**/SELECT  @codeBlockNum   = 20
/**/      , @codeBlockDesc  = @codeBlockDesc20 ; --  UPDATE dbo.Contacts.createdBy, replacing @MergingContactID with @MasterContactID
    UPDATE  dbo.Contacts
       SET  createdBy = @MasterContactID
     WHERE  createdBy = @MergingContactID ;


/**/SELECT  @codeBlockNum   = 21
/**/      , @codeBlockDesc  = @codeBlockDesc21 ; --  UPDATE dbo.Contacts.updatedBy, replacing @MergingContactID with @MasterContactID
    UPDATE  dbo.Contacts
       SET  updatedBy = @MasterContactID
     WHERE  updatedBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 22
/**/      , @codeBlockDesc  = @codeBlockDesc22 ; --  UPDATE dbo.Contacts.verifiedBy, replacing @MergingContactID with @MasterContactID
    UPDATE  dbo.Contacts
       SET  verifiedBy = @MasterContactID
     WHERE  verifiedBy = @MergingContactID ;


/**/SELECT  @codeBlockNum   = 23
/**/      , @codeBlockDesc  = @codeBlockDesc23 ; --  UPDATE dbo.ContactSystems.createdBy, replacing @MergingContactID with @MasterContactID
    UPDATE  dbo.ContactSystems
       SET  createdBy = @MasterContactID
     WHERE  createdBy = @MergingContactID ;


/**/SELECT  @codeBlockNum   = 24
/**/      , @codeBlockDesc  = @codeBlockDesc24 ; --  UPDATE dbo.ContactSystems.updatedBy, replacing @MergingContactID with @MasterContactID
    UPDATE  dbo.ContactSystems
       SET  updatedBy = @MasterContactID
     WHERE  updatedBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 25
/**/      , @codeBlockDesc  = @codeBlockDesc25 ; --  UPDATE dbo.Organizations.createdBy
    UPDATE  dbo.Organizations
       SET  createdBy = @MasterContactID
     WHERE  createdBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 26
/**/      , @codeBlockDesc  = @codeBlockDesc26 ; --  UPDATE dbo.Organizations.updatedBy
    UPDATE  dbo.Organizations
       SET  updatedBy = @MasterContactID
     WHERE  updatedBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 27
/**/      , @codeBlockDesc  = @codeBlockDesc27 ; --  UPDATE dbo.OrganizationSystems.createdBy
    UPDATE  dbo.OrganizationSystems
       SET  createdBy = @MasterContactID
     WHERE  createdBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 28
/**/      , @codeBlockDesc  = @codeBlockDesc28 ; --  UPDATE dbo.OrganizationSystems.updatedBy
    UPDATE  dbo.OrganizationSystems
       SET  updatedBy = @MasterContactID
     WHERE  updatedBy = @MergingContactID ;


/**/SELECT  @codeBlockNum   = 29
/**/      , @codeBlockDesc  = @codeBlockDesc29 ; --  UPDATE dbo.OrgDepartments.createdBy
    UPDATE  dbo.OrgDepartments
       SET  createdBy = @MasterContactID
     WHERE  createdBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 30
/**/      , @codeBlockDesc  = @codeBlockDesc30 ; --  UPDATE dbo.OrgDepartments.updatedBy
    UPDATE  dbo.OrgDepartments
       SET  updatedBy = @MasterContactID
     WHERE  updatedBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 31
/**/      , @codeBlockDesc  = @codeBlockDesc31 ; --  UPDATE dbo.OrgDepartmentSystems.createdBy
    UPDATE  dbo.OrgDepartmentSystems
       SET  createdBy = @MasterContactID
     WHERE  createdBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 32
/**/      , @codeBlockDesc  = @codeBlockDesc32 ; --  UPDATE dbo.OrgDepartmentSystems.updatedBy
    UPDATE  dbo.OrgDepartmentSystems
       SET  updatedBy = @MasterContactID
     WHERE  updatedBy = @MergingContactID ;


/**/SELECT  @codeBlockNum   = 33
/**/      , @codeBlockDesc  = @codeBlockDesc33 ; --  UPDATE dbo.OrgLocations.createdBy
    UPDATE  dbo.OrgLocations
       SET  createdBy = @MasterContactID
     WHERE  createdBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 34
/**/      , @codeBlockDesc  = @codeBlockDesc34 ; --  UPDATE dbo.OrgLocations.updatedBy
    UPDATE  dbo.OrgLocations
       SET  updatedBy = @MasterContactID
     WHERE  updatedBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 35
/**/      , @codeBlockDesc  = @codeBlockDesc35 ; --  UPDATE dbo.OrgLocationSystems.createdBy
    UPDATE  dbo.OrgLocationSystems
       SET  createdBy = @MasterContactID
     WHERE  createdBy = @MergingContactID ;

/**/SELECT  @codeBlockNum   = 36
/**/      , @codeBlockDesc  = @codeBlockDesc36 ; --  UPDATE dbo.OrgLocationSystems.updatedBy
    UPDATE  dbo.OrgLocationSystems
       SET  updatedBy = @MasterContactID
     WHERE  updatedBy = @MergingContactID ;


/**/SELECT  @codeBlockNum   = 37
/**/      , @codeBlockDesc  = @codeBlockDesc37 ; --  UPDATE dbo.Contact, denoting merge
    UPDATE  dbo.Contacts
       SET  email        = NULL
          , userLogin    = NULL
          , userPassword = NULL
          , salt         = NULL
          , Q1           = NULL
          , Q2           = NULL
          , Q3           = NULL
          , iAnswer      = NULL
          , isActive     = 0
          , aboutMe      = NULL
          , signature    = 'Merged Into Contact.ID ' + CAST (@MasterContactID AS NVARCHAR(50) )
          , updatedOn    = SYSDATETIME()
          , updatedBy    = '00000000-0000-0000-0000-000000000000'
     WHERE  ID = @MergingContactID ;

    PRINT   'Contact Records Merged' ;

END TRY
BEGIN CATCH

    IF  @@TRANCOUNT > 0
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