CREATE PROCEDURE Utility.MergeOrgDepartments ( @MasterOrganizationID  AS UNIQUEIDENTIFIER )
AS
/*
************************************************************************************************************************************

  Procedure:    Utility.MergeOrgDepartments
     Author:    Chris Carson
    Purpose:    Merges Departments for an Organization

    revisor     date            description
    ---------   ----------      ---------------------------
    ccarson     ###DATE###      created proc

    Logic Summary:

    1)  SELECT keys for OrgDepartments
    2)  INSERT records into MasterKeyTable
    3)  Find all portals that exist for current set of records
    4)  INSERT missing portal records for master keys
    5)  replace orgDepartmentID on ContactOrganizations
    6)  replace orgDepartmentID on ContactOrgRoles
    7)  replace orgDepartmentID on OrganizationTaxonomyResponsibilities
    8)  DELETE OrgDepartmentSystems records for merging keys
    9)  DELETE OrgDepartments records for merging keys

    NOTES

    FERN and NAHLN are excluded from this process

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


    DECLARE @codeBlockDesc01    AS NVARCHAR (128)   = 'SELECT keys for OrgDepartments ( without parent )'
          , @codeBlockDesc02    AS NVARCHAR (128)   = 'INSERT records into MasterKeyTable'
          , @codeBlockDesc03    AS NVARCHAR (128)   = 'replace parentDepartmentID on OrgDepartments'
          , @codeBlockDesc04    AS NVARCHAR (128)   = 'SELECT keys for OrgDepartments ( including parent )'
          , @codeBlockDesc05    AS NVARCHAR (128)   = 'INSERT records into MasterKeyTable'
          , @codeBlockDesc06    AS NVARCHAR (128)   = 'Find all portals that exist for current set of records'
          , @codeBlockDesc07    AS NVARCHAR (128)   = 'INSERT missing portal records for master keys'
          , @codeBlockDesc08    AS NVARCHAR (128)   = 'replace orgDepartmentID on ContactOrganizations'
          , @codeBlockDesc09    AS NVARCHAR (128)   = 'replace orgDepartmentID on OrganizationTaxonomyResponsibilities'
          , @codeBlockDesc10    AS NVARCHAR (128)   = 'replace orgDepartmentID on ContactOrgRoles'
          , @codeBlockDesc11    AS NVARCHAR (128)   = 'DELETE OrgDepartmentSystems records for merging keys'
          , @codeBlockDesc12    AS NVARCHAR (128)   = 'DELETE OrgDepartments records for merging keys' ;
                    


    DECLARE @recordKeys         AS TABLE ( recordID     UNIQUEIDENTIFIER
                                         , recordKey    NVARCHAR (MAX) ) ;

    DECLARE @masterKeyTable     AS TABLE ( masterID     UNIQUEIDENTIFIER
                                         , mergingID    UNIQUEIDENTIFIER ) ;

    DECLARE @excludedRecords    AS TABLE ( id      UNIQUEIDENTIFIER ) ;

    DECLARE @mergingPortals     AS TABLE ( systemID     INT ) ;

    DECLARE @recordID           AS INT              = 0
          , @utilityID          AS UNIQUEIDENTIFIER = '00000000-0000-0000-0000-000000000000' ;

          
/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ; -- SELECT keys for OrgDepartments ( without parent )

    INSERT  @excludedRecords
    SELECT  DISTINCT orgDepartmentID
      FROM  Core.mc_org_departments WHERE portalName IN ( 'mcFERN', 'mcNAHLN' ) ;

    INSERT  @recordKeys ( recordID, recordKey )
    SELECT  recordID  = ID
          , recordKey = ISNULL( NULLIF( name, '' ), 'xxx' ) +
                        CAST( orgLocationID AS VARCHAR(50) ) 
      FROM  dbo.OrgDepartments AS od
     WHERE  od.organizationID = @MasterOrganizationID
       AND  NOT EXISTS ( SELECT 1 FROM @excludedRecords AS x WHERE x.ID = od.ID ) ;


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc02 ; -- INSERT records into MasterKeyTable

      WITH  ordered AS (
            SELECT  recordID, recordKey, N = ROW_NUMBER() OVER ( PARTITION BY recordKey ORDER BY recordID )
              FROM  @recordKeys ) ,
            masterKeys AS ( SELECT * FROM ordered WHERE N = 1 ) ,
            mergingKeys AS ( SELECT * FROM ordered WHERE N > 1 )
    INSERT  @masterKeyTable ( mergingID, masterID )
    SELECT  DISTINCT mrg.recordID, mas.recordID
      FROM  mergingKeys AS mrg
INNER JOIN  masterKeys  AS mas ON mas.recordKey = mrg.recordKey ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; -- replace parentDepartmentID on OrgDepartments

    BEGIN TRANSACTION ;

    UPDATE  dbo.OrgDepartments
       SET  parentDepartmentID = k.masterID
      FROM  dbo.OrgDepartments AS od
INNER JOIN  @masterKeyTable    AS k ON k.mergingID = od.parentDepartmentID ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ; -- SELECT keys for OrgDepartments ( including parent )

    DELETE  @recordKeys ;
    DELETE  @MasterKeyTable ;

    INSERT  @recordKeys ( recordID, recordKey )
    SELECT  recordID  = ID
          , recordKey = ISNULL( NULLIF( name, '' ), 'xxx' ) +
                        CAST( orgLocationID AS VARCHAR(50) ) + 
                        ISNULL ( CAST( parentDepartmentID AS VARCHAR(50) ), 'xxx' )
      FROM  dbo.OrgDepartments AS od
     WHERE  od.organizationID = @MasterOrganizationID
       AND  NOT EXISTS ( SELECT 1 FROM @excludedRecords AS x WHERE x.ID = od.ID ) ;


/**/SELECT  @codeBlockNum   = 5
/**/      , @codeBlockDesc  = @codeBlockDesc05 ; -- INSERT records into MasterKeyTable

      WITH  ordered AS (
            SELECT  recordID, recordKey, N = ROW_NUMBER() OVER ( PARTITION BY recordKey ORDER BY recordID )
              FROM  @recordKeys ) ,

            masterKeys AS ( SELECT * FROM ordered WHERE N = 1 ) ,
            mergingKeys AS ( SELECT * FROM ordered WHERE N > 1 )
    INSERT  @masterKeyTable ( mergingID, masterID )
    SELECT  DISTINCT mrg.recordID, mas.recordID
      FROM  mergingKeys AS mrg
INNER JOIN  masterKeys  AS mas ON mas.recordKey = mrg.recordKey ;


/**/SELECT  @codeBlockNum   = 6
/**/      , @codeBlockDesc  = @codeBlockDesc06 ; -- Find all portals that exist for current set of records

    INSERT  @mergingPortals
    SELECT  DISTINCT systemID
      FROM  Core.mc_org_departments AS o
     WHERE  EXISTS ( SELECT 1 FROM @masterKeyTable k WHERE k.mergingID = o.orgDepartmentID )
       AND  portalName NOT IN ( 'mcFERN', 'mcNAHLN' ) ;

       
/**/SELECT  @codeBlockNum   = 7
/**/      , @codeBlockDesc  = @codeBlockDesc07 ; -- INSERT missing portal records for master keys

    SELECT  @recordID = MAX( mc_org_departmentsID ) FROM dbo.OrgDepartmentSystems ;

      WITH  records AS (
            SELECT  DISTINCT
            masterID
          , systemID
          , createdOn = SYSDATETIME()
          , createdBy = @utilityID
          , updatedOn = SYSDATETIME()
          , updatedBy = @utilityID
      FROM  @masterKeyTable AS k
CROSS JOIN  @mergingPortals AS p
     WHERE  NOT EXISTS ( SELECT 1 FROM dbo.OrgDepartmentSystems AS ol
                          WHERE ol.ID = k.masterID AND ol.systemID = p.systemID ) )

    INSERT  dbo.OrgDepartmentSystems ( ID, systemID, createdOn, createdBy, updatedOn, updatedBy
                , mc_org_departmentsID )
    SELECT  *
          , @recordID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  records ;
      

/**/SELECT  @codeBlockNum   = 8
/**/      , @codeBlockDesc  = @codeBlockDesc08 ; -- replace orgDepartmentID on ContactOrganizations

    UPDATE  dbo.ContactOrganizations
       SET  orgDepartmentsID = k.masterID
      FROM  dbo.ContactOrganizations AS co
INNER JOIN  @masterKeyTable          AS k ON k.mergingID = co.orgDepartmentsID ;


/**/SELECT  @codeBlockNum   = 9
/**/      , @codeBlockDesc  = @codeBlockDesc09 ; -- replace orgDepartmentID on OrganizationTaxonomyResponsibilities

    UPDATE  dbo.OrganizationTaxonomyResponsibilities
       SET  OrgDepartmentID = k.masterID
      FROM  dbo.OrganizationTaxonomyResponsibilities AS od
INNER JOIN  @masterKeyTable                          AS k ON k.mergingID = od.orgDepartmentID ;


/**/SELECT  @codeBlockNum   = 10
/**/      , @codeBlockDesc  = @codeBlockDesc10 ; -- replace orgDepartmentID on ContactOrgRoles

    UPDATE  dbo.ContactOrgRoles
       SET  orgDepartmentsID = k.masterID
      FROM  dbo.ContactOrgRoles AS co
INNER JOIN  @masterKeyTable     AS k ON k.mergingID = co.orgDepartmentsID ;


/**/SELECT  @codeBlockNum   = 11
/**/      , @codeBlockDesc  = @codeBlockDesc11 ; -- DELETE OrgDepartmentSystems records for merging keys

    DELETE  dbo.OrgDepartmentSystems
      FROM  dbo.OrgDepartmentSystems AS ods
     WHERE  EXISTS ( SELECT 1 FROM @masterKeyTable AS k WHERE k.mergingID = ods.id ) ;


/**/SELECT  @codeBlockNum   = 12
/**/      , @codeBlockDesc  = @codeBlockDesc12 ; -- DELETE OrgDepartments records for merging keys

    DELETE  dbo.OrgDepartments
      FROM  dbo.OrgDepartments AS ogd
     WHERE  EXISTS ( SELECT 1 FROM @masterKeyTable AS k WHERE k.mergingID = ogd.ID ) ;


    COMMIT TRANSACTION ;

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION ;


    SELECT  @errorSeverity  = ERROR_SEVERITY()
          , @errorState     = ERROR_STATE()
          , @errorNumber    = ERROR_NUMBER()
          , @errorLine      = ERROR_LINE()
          , @errorProcedure = ISNULL( ERROR_PROCEDURE(), '-' ) ;

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

END CATCH

END