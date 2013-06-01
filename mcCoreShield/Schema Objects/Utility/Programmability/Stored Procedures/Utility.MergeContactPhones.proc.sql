CREATE PROCEDURE Utility.MergeContactPhones ( @MasterContactID   AS UNIQUEIDENTIFIER
                                            , @MergingContactID  AS UNIQUEIDENTIFIER
                                            , @errorMessage      AS NVARCHAR (4000) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:    Utility.MergeContactPhones
     Author:    Chris Carson
    Purpose:    Merges records on dbo.ContactPhones for two coreShield Contacts

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
          , @codeBlockDesc05    AS NVARCHAR (128)   = 'DELETE dbo.transitionIdentities records for some duplicates'
          , @codeBlockDesc06    AS NVARCHAR (128)   = 'UPDATE dbo.transitionIdentities for remaining duplicates'
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
          , @tableName          AS NVARCHAR (20) = 'mc_contact_phones' ;

/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ; -- Begin transaction if required

    IF  @@TRANCOUNT = 0
    BEGIN
        BEGIN TRANSACTION ;
        SELECT @transactionStarted = 1 ;
    END


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc02 ; -- UPDATE coreShield records to @MasterContactID

    UPDATE  dbo.ContactAddresses
       SET  contactsID = @MasterContactID
     WHERE  contactsID = @MergingContactID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; -- INSERT partitioned record keys into temp storage

      WITH  records AS (
            SELECT  recordID    = c.ID
                  , recordKey   = ISNULL( phone, 'xx' ) + '|' +
                                  ISNULL( extension, 'xx' )
                  , systemID    = transitionSystemsID
                  , legacyID    = legacyID
              FROM  dbo.ContactPhones           AS c
         LEFT JOIN  dbo.transitionIdentities    AS t ON t.id = c.id
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
/**/      , @codeBlockDesc  = @codeBlockDesc05 ; -- DELETE dbo.transitionIdentities records for some duplicates

      WITH  duplicates AS (
            SELECT  id          = mergingID
                  , systemID    = mergingSystemID
              FROM  @mergeTable
             WHERE  mergingSystemID = masterSystemID OR
                  ( mergingSystemID <> masterSystemID AND ordinal > 1 ) ) ,

            records AS (
            SELECT  id, transitionSystemsID, convertedTableID, legacyID
              FROM  dbo.transitionIdentities AS ti
             WHERE  EXISTS ( SELECT 1 FROM duplicates AS d
                              WHERE d.ID = ti.id AND d.systemID = ti.transitionSystemsID ) )
    DELETE  records
    OUTPUT  deleted.id, deleted.transitionSystemsID
      INTO  @deleted ( id, systemID ) ;


/**/SELECT  @codeBlockNum   = 6
/**/      , @codeBlockDesc  = @codeBlockDesc06 ; -- UPDATE dbo.transitionIdentities for remaining duplicates

      WITH  duplicates AS (
            SELECT  masterID    = masterID
                  , id          = mergingID
                  , systemID    = mergingSystemID
              FROM  @mergeTable
             WHERE  mergingSystemID <> masterSystemID AND ordinal = 1 )

    UPDATE  dbo.transitionIdentities
       SET  id = d.masterID
    OUTPUT  deleted.ID INTO @deleted ( id )
      FROM  dbo.transitionIdentities AS ti
INNER JOIN  duplicates AS d ON d.id = ti.id AND d.systemID = ti.transitionSystemsID ;


/**/SELECT  @codeBlockNum   = 7
/**/      , @codeBlockDesc  = @codeBlockDesc07 ; -- DELETE core records for modified duplicates

    DELETE  dbo.ContactPhones
      FROM  dbo.ContactPhones AS c
     WHERE  EXISTS ( SELECT 1 FROM @deleted AS d WHERE d.id = c.ID ) ;


/**/SELECT  @codeBlockNum   = 8
/**/      , @codeBlockDesc  = @codeBlockDesc08 ; -- load systemIDs from portal records into temp storage

    INSERT  @portals
    SELECT  masterSystemID FROM @mergeTable WHERE masterSystemID IS NOT NULL
        UNION
    SELECT  mergingSystemID FROM @mergeTable WHERE mergingSystemID IS NOT NULL ;


/**/SELECT  @codeBlockNum   = 9
/**/      , @codeBlockDesc  = @codeBlockDesc09 ; -- create new portal records showing all records for all portals

    SELECT  @convertedTableID = ID FROM dbo.coreConvertedTables WHERE tableName = @tableName ;
    SELECT  @legacyID = MAX( legacyID ) FROM dbo.transitionIdentities WHERE convertedTableID = @convertedTableID ;

      WITH  newRecords AS (
            SELECT  DISTINCT masterID, p.systemID
              FROM  @mergeTable AS mk
        CROSS JOIN  @portals    AS p )

    INSERT  dbo.transitionIdentities
    SELECT  id                  = masterID
          , transitionSystemsID = systemID
          , convertedTableID    = @convertedTableID
          , legacyID            = @legacyID + ROW_NUMBER() OVER ( ORDER BY ( SELECT NULL ) )
      FROM  newRecords AS r
     WHERE  NOT EXISTS ( SELECT 1 FROM dbo.transitionIdentities AS ti
                          WHERE ti.ID = r.masterID and ti.transitionSystemsID = r.systemID ) ;


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