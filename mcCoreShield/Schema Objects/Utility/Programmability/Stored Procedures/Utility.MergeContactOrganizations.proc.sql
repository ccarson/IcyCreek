CREATE PROCEDURE Utility.MergeContactOrganizations ( @MasterContactID   AS UNIQUEIDENTIFIER
                                                   , @MergingContactID  AS UNIQUEIDENTIFIER
                                                   , @errorMessage      AS NVARCHAR (4000) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:    Utility.MergeContactOrganizations
     Author:    Chris Carson
    Purpose:    Merges records on dbo.ContactOrganizations for two coreShield Contacts

    revisor     date            description
    ---------   ----------      ---------------------------
    ccarson     ###DATE###      created proc

    Logic Summary:
    1)  Begin transaction if required
    2)  UPDATE coreShield records to @MasterContactID
    3)  INSERT partitioned record keys into temp storage
    4)  match master record and merge records into temp storage
    5)  DELETE dbo.transitionIdentities records for some duplicates
    6)  UPDATE dbo.transitionIdentities for remaining duplicates
    7)  DELETE core records for modified duplicates
    8)  load systemIDs from portal records into temp storage
    9)  create new portal records showing all records for all portals

    NOTES

************************************************************************************************************************************
*/
BEGIN
BEGIN TRY

    SET NOCOUNT ON ;

    DECLARE @codeBlockNum       AS INT              = NULL
          , @codeBlockDesc      AS NVARCHAR (128)   = NULL
          , @errorLine          AS INT
          , @errorNumber        AS INT
          , @errorProcedure     AS SYSNAME
          , @errorSeverity      AS INT
          , @errorState         AS INT ;

    DECLARE @codeBlockDesc01    AS NVARCHAR (128)   = 'Begin transaction if required'
          , @codeBlockDesc02    AS NVARCHAR (128)   = 'UPDATE coreShield records to @MasterContactID'
          , @codeBlockDesc03    AS NVARCHAR (128)   = 'INSERT partitioned record keys into temp storage'
          , @codeBlockDesc04    AS NVARCHAR (128)   = 'match master record and merge records into temp storage'
          , @codeBlockDesc05    AS NVARCHAR (128)   = 'DELETE portal records for some duplicates'
          , @codeBlockDesc06    AS NVARCHAR (128)   = 'UPDATE portal for remaining duplicates'
          , @codeBlockDesc07    AS NVARCHAR (128)   = 'DELETE core records for modified duplicates'
          , @codeBlockDesc08    AS NVARCHAR (128)   = 'load systemIDs from portal records into temp storage'
          , @codeBlockDesc09    AS NVARCHAR (128)   = 'create new portal records showing all records for all portals' ;


    DECLARE @recordKeys         AS TABLE ( recordID         UNIQUEIDENTIFIER
                                         , recordKey        NVARCHAR (MAX)
                                         , systemID         INT
                                         , legacyID         INT
                                         , ordinal          INT ) ;

    DECLARE @mergeTable         AS TABLE ( masterID         UNIQUEIDENTIFIER
                                         , masterSystemID   INT
                                         , mergingID        UNIQUEIDENTIFIER
                                         , mergingSystemID  INT
                                         , ordinal          INT ) ;

    DECLARE @deleted            AS TABLE ( ID               UNIQUEIDENTIFIER
                                         , SystemID         INT  ) ;

    DECLARE @portals            AS TABLE ( systemID         INT ) ;

    DECLARE @legacyID           AS INT
          , @convertedTableID   AS INT ;

    DECLARE @transactionStarted AS BIT
          , @conversionID       AS UNIQUEIDENTIFIER = '00000000-0000-0000-0000-000000000000' ;

/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ; -- Begin transaction if required

    IF  @@TRANCOUNT = 0
    BEGIN
        BEGIN TRANSACTION ;
        SELECT @transactionStarted = 1 ;
    END


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc02 ; -- UPDATE coreShield records to @MasterContactID

    UPDATE  dbo.ContactOrganizations
       SET  contactsID = @MasterContactID
     WHERE  contactsID = @MergingContactID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; -- INSERT partitioned record keys into temp storage

      WITH  records AS (
            SELECT  recordID    = c.ID
                  , recordKey   = CAST( c.organizationsID AS NVARCHAR(50) ) + '|' +
                                  ISNULL( CAST( c.orgDepartmentsID AS NVARCHAR(50) ), 'xx' ) + '|' +
                                  ISNULL( CAST( c.orgLocationsID AS NVARCHAR(50) ), 'xx' )
                  , systemID    = s.systemID
                  , legacyID    = s.mc_contact_organizationsID
              FROM  dbo.ContactOrgSystems       AS s
        INNER JOIN  dbo.ContactOrganizations    AS c ON c.ID = s.ID
             WHERE  c.contactsID = @MasterContactID )

    INSERT  @recordKeys ( recordID, recordKey, systemID, legacyID, ordinal )
    SELECT  recordID, recordKey, systemID, legacyID
          , ROW_NUMBER() OVER ( PARTITION BY recordKey ORDER BY systemID, legacyID )
      FROM  records ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ; -- match master record and merge records into temp storage

      WITH  masterKeys AS ( SELECT * FROM @recordKeys WHERE ordinal = 1 ) ,
            mergingKeys AS ( SELECT * FROM @recordKeys WHERE ordinal > 1 )

    INSERT  @mergeTable ( masterID, masterSystemID, mergingID, mergingSystemID, ordinal )
    SELECT  mas.recordID, mas.systemID, mrg.recordID, mrg.systemID
          , ROW_NUMBER() OVER ( PARTITION BY mas.recordID, mrg.systemID ORDER BY mrg.systemID, mrg.legacyID )
      FROM  masterKeys  AS mas
 LEFT JOIN  mergingKeys AS mrg ON mrg.recordKey = mas.recordKey ;


/**/SELECT  @codeBlockNum   = 5
/**/      , @codeBlockDesc  = @codeBlockDesc05 ; -- DELETE portal records for some duplicates

      WITH  duplicates AS (
            SELECT  id          = mergingID
                  , systemID    = mergingSystemID
              FROM  @mergeTable
             WHERE  mergingSystemID = masterSystemID OR
                  ( mergingSystemID <> masterSystemID AND ordinal > 1 ) ) ,

            records AS (
            SELECT  id, systemID, createdOn, createdBy, updatedOn, updatedBy, mc_contact_organizationsID
              FROM  dbo.ContactOrgSystems AS s
             WHERE  EXISTS ( SELECT 1 FROM duplicates AS d
                              WHERE d.ID = s.id AND d.systemID = s.systemID ) )
    DELETE  records
    OUTPUT  deleted.id, deleted.systemID
      INTO  @deleted ( id, systemID ) ;


/**/SELECT  @codeBlockNum   = 6
/**/      , @codeBlockDesc  = @codeBlockDesc06 ; -- UPDATE portal records for remaining duplicates

      WITH  duplicates AS (
            SELECT  masterID    = masterID
                  , id          = mergingID
                  , systemID    = mergingSystemID
              FROM  @mergeTable
             WHERE  mergingSystemID <> masterSystemID AND ordinal = 1 )

    UPDATE  dbo.ContactOrgSystems
       SET  ID = d.masterID
    OUTPUT  deleted.ID INTO @deleted ( id )
      FROM  dbo.ContactOrgSystems AS s
INNER JOIN  duplicates AS d ON d.id = s.id AND d.systemID = s.systemID ;


/**/SELECT  @codeBlockNum   = 7
/**/      , @codeBlockDesc  = @codeBlockDesc07 ; -- DELETE core records for modified duplicates

    DELETE  dbo.ContactOrganizations
      FROM  dbo.ContactOrganizations AS c
     WHERE  EXISTS ( SELECT 1 FROM @deleted AS d WHERE d.id = c.ID ) ;


/**/SELECT  @codeBlockNum   = 8
/**/      , @codeBlockDesc  = @codeBlockDesc08 ; -- load systemIDs from portal records into temp storage

    INSERT  @portals
    SELECT  masterSystemID FROM @mergeTable WHERE masterSystemID IS NOT NULL
        UNION
    SELECT  mergingSystemID FROM @mergeTable WHERE mergingSystemID IS NOT NULL ;


/**/SELECT  @codeBlockNum   = 9
/**/      , @codeBlockDesc  = @codeBlockDesc09 ; -- create new portal records showing all records for all portals

    SELECT  @legacyID = MAX( mc_contact_organizationsID )
      FROM  dbo.ContactOrgSystems ;

      WITH  newRecords AS (
            SELECT  DISTINCT masterID, p.systemID
              FROM  @mergeTable AS mk
        CROSS JOIN  @portals    AS p )

    INSERT  dbo.ContactOrgSystems
    SELECT  ID                          = masterID
          , systemID                    = systemID
          , createdOn                   = SYSDATETIME()
          , createdBy                   = @conversionID
          , updatedOn                   = NULL
          , updatedBy                   = NULL
          , mc_contact_organizationsID  = @legacyID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  newRecords AS r
     WHERE  NOT EXISTS ( SELECT 1 FROM dbo.ContactOrgSystems AS s
                          WHERE s.ID = r.masterID and s.systemID = r.systemID ) ;


    IF  @transactionStarted = 1
        COMMIT TRANSACTION ;

END TRY
BEGIN CATCH
    IF  @transactionStarted = 1
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