CREATE PROCEDURE Utility.MergeOrgLocations ( @MasterOrganizationID  AS UNIQUEIDENTIFIER )
AS
/*
************************************************************************************************************************************

  Procedure:    Utility.MergeOrgLocations
     Author:    Chris Carson
    Purpose:    Merges Locations for an Organization

    revisor     date            description
    ---------   ----------      ---------------------------
    ccarson     ###DATE###      created proc

    Logic Summary:

    1)  SELECT keys for OrgLocations
    2)  INSERT records into MasterKeyTable
    3)  Find all portals that exist for current set of records
    4)  INSERT missing portal records for master keys
    5)  replace orgLocationID on OrgDepartments
    6)  replace orgLocationID on OrganizationTaxonomyResponsibilities
    7)  replace orgLocationID on ContactOrganizations
    8)  DELETE OrgLocationSystems records for merging keys
    9)  DELETE OrgLocations records for merging keys

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


    DECLARE @codeBlockDesc01    AS NVARCHAR (128)   = 'SELECT keys for nahlnLocations'
          , @codeBlockDesc02    AS NVARCHAR (128)   = 'SELECT keys for OrgLocations'
          , @codeBlockDesc03    AS NVARCHAR (128)   = 'INSERT records into MasterKeyTable'
          , @codeBlockDesc04    AS NVARCHAR (128)   = 'Find all portals that exist for current set of records'
          , @codeBlockDesc05    AS NVARCHAR (128)   = 'INSERT missing portal records for master keys'
          , @codeBlockDesc06    AS NVARCHAR (128)   = 'replace orgLocationID on OrgDepartments'
          , @codeBlockDesc07    AS NVARCHAR (128)   = 'replace orgLocationID on OrganizationTaxonomyResponsibilities'
          , @codeBlockDesc08    AS NVARCHAR (128)   = 'replace orgLocationID on ContactOrganizations'
          , @codeBlockDesc09    AS NVARCHAR (128)   = 'UPDATE @nahlnLocations with new location_id' 
          , @codeBlockDesc10    AS NVARCHAR (128)   = 'UPDATE mcNAHLN.dbo.mc_org_dept_locations with new location_id' 
          , @codeBlockDesc11    AS NVARCHAR (128)   = 'DELETE OrgLocationSystems records for merging keys' 
          , @codeBlockDesc12    AS NVARCHAR (128)   = 'DELETE OrgLocations records for merging keys' ;
          
          
          
          ;


    DECLARE @recordKeys         AS TABLE ( recordID     UNIQUEIDENTIFIER
                                         , recordKey    NVARCHAR (MAX) ) ;

    DECLARE @masterKeyTable     AS TABLE ( masterID     UNIQUEIDENTIFIER
                                         , mergingID    UNIQUEIDENTIFIER ) ;

    DECLARE @mergingPortals     AS TABLE ( systemID     INT ) ;

    DECLARE @nahlnLocations     AS TABLE ( recordID     UNIQUEIDENTIFIER
                                         , location_id  INT
                                         , new_location INT ) ;



    DECLARE @recordID           AS INT              = 0
          , @utilityID          AS UNIQUEIDENTIFIER = '00000000-0000-0000-0000-000000000000'
          , @nahlnSystemID      AS INT ; 


/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ; -- SELECT keys for nahlnLocations

    INSERT  @nahlnLocations ( recordID, location_id )
    SELECT  orgLocationID, id
      FROM  Core.mc_org_location AS ol
     WHERE  organizationID = @MasterOrganizationID AND ol.portalName = 'mcNAHLN'
       AND  EXISTS ( SELECT 1 FROM mcNAHLN.dbo.mc_org_dept_locations AS x WHERE x.location_id = ol.id ) ;


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc02 ; -- SELECT keys for OrgLocations

    INSERT  @recordKeys ( recordID, recordKey )
    SELECT  recordID  = ID
          , recordKey = ISNULL( NULLIF( address1, '' ), 'xxx' ) + '|' +
                        ISNULL( NULLIF( address2, '' ), 'xxx' ) + '|' +
                        ISNULL( NULLIF( address3, '' ), 'xxx' ) + '|' +
                        ISNULL( NULLIF( city, '' ), 'xxx' ) + '|' +
                        ISNULL( NULLIF( state, '' ), 'xxx' )
      FROM  dbo.OrgLocations
     WHERE  organizationID = @MasterOrganizationID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; -- INSERT records into MasterKeyTable

      WITH  ordered AS (
            SELECT  recordID, recordKey, N = ROW_NUMBER() OVER ( PARTITION BY recordKey ORDER BY recordID )
              FROM  @recordKeys ) ,

            masterKeys AS ( SELECT * FROM ordered WHERE N = 1 ) ,
            mergingKeys AS ( SELECT * FROM ordered WHERE N > 1 )
    INSERT  @masterKeyTable ( mergingID, masterID )
    SELECT  DISTINCT mrg.recordID, mas.recordID
      FROM  mergingKeys AS mrg
INNER JOIN  masterKeys  AS mas ON mas.recordKey = mrg.recordKey ;
        
/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ; -- Find all portals that exist for current set of records

    INSERT  @mergingPortals
    SELECT  DISTINCT systemID
      FROM  Core.mc_org_location AS o
     WHERE  EXISTS ( SELECT 1 FROM @masterKeyTable k WHERE k.mergingID = o.orgLocationID ) ;


/**/SELECT  @codeBlockNum   = 5
/**/      , @codeBlockDesc  = @codeBlockDesc05 ; -- INSERT missing portal records for master keys

    BEGIN TRANSACTION ;

    SELECT  @recordID = MAX( mc_org_locationID ) FROM dbo.OrgLocationSystems ;

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
     WHERE  NOT EXISTS ( SELECT 1 FROM dbo.OrgLocationSystems AS ol
                          WHERE ol.ID = k.masterID AND ol.systemID = p.systemID ) )

    INSERT  dbo.OrgLocationSystems ( ID, systemID, createdOn, createdBy, updatedOn, updatedBy
                , mc_org_locationID )
    SELECT  *
          , @recordID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  records ;

/**/SELECT  @codeBlockNum   = 6
/**/      , @codeBlockDesc  = @codeBlockDesc06 ; -- replace orgLocationID on OrgDepartments

    UPDATE  dbo.OrgDepartments
       SET  orgLocationID = k.masterID
      FROM  dbo.OrgDepartments AS od
INNER JOIN  @masterKeyTable    AS k ON k.mergingID = od.orgLocationID ;


/**/SELECT  @codeBlockNum   = 7
/**/      , @codeBlockDesc  = @codeBlockDesc07 ; -- replace orgLocationID on OrganizationTaxonomyResponsibilities

    UPDATE  dbo.OrganizationTaxonomyResponsibilities
       SET  OrgLocationID = k.masterID
      FROM  dbo.OrganizationTaxonomyResponsibilities AS od
INNER JOIN  @masterKeyTable    AS k ON k.mergingID = od.orgLocationID ;


/**/SELECT  @codeBlockNum   = 8
/**/      , @codeBlockDesc  = @codeBlockDesc08 ; -- replace orgLocationID on ContactOrganizations

    UPDATE  dbo.ContactOrganizations
       SET  orgLocationsID = k.masterID
      FROM  dbo.ContactOrganizations AS co
INNER JOIN  @masterKeyTable          AS k ON k.mergingID = co.orgLocationsID ;


/**/SELECT  @codeBlockNum   = 9
/**/      , @codeBlockDesc  = @codeBlockDesc09 ; -- UPDATE @nahlnLocations with new location_id
    
    SELECT  @nahlnSystemID = ID FROM Reference.Systems WHERE systemName = 'mcNAHLN' ; 

    UPDATE  @nahlnLocations
       SET  new_location = ols.mc_org_locationID
      FROM  @nahlnLocations         AS nhl
INNER JOIN  @masterKeyTable         AS mk ON mk.mergingID = nhl.recordID
INNER JOIN  dbo.OrgLocationSystems  AS ols ON ols.ID = mk.masterID AND systemID = @nahlnSystemID ; 


/**/SELECT  @codeBlockNum   = 10
/**/      , @codeBlockDesc  = @codeBlockDesc10 ; -- UPDATE mcNAHLN.dbo.mc_org_dept_locations with new location_id
    
    UPDATE  mcNAHLN.dbo.mc_org_dept_locations
       SET  location_ID = COALESCE( new_location, odl.location_id )
      FROM  mcNAHLN.dbo.mc_org_dept_locations AS odl
INNER JOIN  @nahlnLocations                   AS nhl ON nhl.location_id = odl.location_ID ; 


/**/SELECT  @codeBlockNum   = 11
/**/      , @codeBlockDesc  = @codeBlockDesc11 ; -- DELETE OrgLocationSystems records for merging keys

    DELETE  dbo.OrgLocationSystems
      FROM  dbo.OrgLocationSystems AS ols
     WHERE  EXISTS ( SELECT 1 FROM @masterKeyTable AS k WHERE k.mergingID = ols.id ) ;


/**/SELECT  @codeBlockNum   = 12
/**/      , @codeBlockDesc  = @codeBlockDesc12 ; -- DELETE OrgLocations records for merging keys

    DELETE  dbo.OrgLocations
      FROM  dbo.OrgLocations AS ogl
     WHERE  EXISTS ( SELECT 1 FROM @masterKeyTable AS k WHERE k.mergingID = ogl.id ) ;

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