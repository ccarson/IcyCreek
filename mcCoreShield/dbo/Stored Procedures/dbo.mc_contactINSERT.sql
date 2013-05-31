CREATE PROCEDURE [dbo].[mc_contactINSERT] ( @systemID       AS INT
                                      , @recordsIN      AS INT
                                      , @dataXML        AS XML
                                      , @errorMessage   AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:  dbo.mc_contactINSERT
     Author:  Chris Carson
    Purpose:  INSERTs portal view data into dbo.Contacts and related tables on coreSHIELD

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2013-03-05      created


    Logic Summary:
    1)  Load temp storage with shredded XML data
    2)  SELECT legacyID for new records
    3)  UPDATE temporary storage with legacyID
    4)  UPDATE dbo.Contacts from temp storage with matching email
    5)  INSERT into dbo.Contacts from temp storage with new email
    6)  INSERT into dbo.ContactSystems from temp storage
    7)  UPDATE temp storage from dbo.ContactSystems
    8)  UPDATE dbo.Contacts from temp storage with createdBy and updatedBy
    9)  UPDATE dbo.ContactSystems from temp storage with createdBy and updatedBy

    NOTES
        This proc also converts legacy records from an existing system.
        Records that are INSERTed onto portal mc_contact with the id field already filled in
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
          , @codeBlockDesc04    AS NVARCHAR (128)   = 'UPDATE temporary storage with contactID when emails match'
          , @codeBlockDesc05    AS NVARCHAR (128)   = 'UPDATE dbo.Contacts from temp storage with matching contactID'
          , @codeBlockDesc06    AS NVARCHAR (128)   = 'INSERT into dbo.Contacts from temp storage with new contactID'
          , @codeBlockDesc07    AS NVARCHAR (128)   = 'INSERT into dbo.ContactSystems from temp storage'
          , @codeBlockDesc08    AS NVARCHAR (128)   = 'UPDATE temp storage from dbo.ContactSystems'
          , @codeBlockDesc09    AS NVARCHAR (128)   = 'UPDATE dbo.Contacts from temp storage with createdBy and updatedBy'
          , @codeBlockDesc10    AS NVARCHAR (128)   = 'UPDATE dbo.ContactSystems from temp storage with createdBy and updatedBy' ;

    DECLARE @controlCount       AS INT
          , @controlTotalsError AS NVARCHAR(200)    = N'Control Total Failure:  %s = %d, %s = %d' ;


    DECLARE @legacyID           AS INT = 0 ;

    DECLARE @sourceData         AS TABLE ( legacyID         INT
                                         , Salutation       NVARCHAR (20)
                                         , JobTitle         NVARCHAR (255)
                                         , Firstname        NVARCHAR (50)
                                         , Initial          NVARCHAR (50)
                                         , Lastname         NVARCHAR (50)
                                         , Suffix           NVARCHAR (20)
                                         , Email            NVARCHAR (50)
                                         , Login            NVARCHAR (50)
                                         , Password         NVARCHAR (500)
                                         , salt             NVARCHAR (35)
                                         , AccessID         INT
                                         , Expires          DATETIME2 (7)
                                         , Hits             INT
                                         , LastLogin        DATETIME2 (7)
                                         , Status           NVARCHAR (20)
                                         , ModifiedBy       INT
                                         , DateModified     DATETIME2 (7)
                                         , datejoined       DATETIME2 (7)
                                         , membertype       INT
                                         , photo            NVARCHAR (120)
                                         , resume           NVARCHAR (120)
                                         , thumb            NVARCHAR (120)
                                         , PIN              INT
                                         , reset            BIT
                                         , mailsent         BIT
                                         , sysmember        INT
                                         , maildate         DATETIME2 (7)
                                         , updatesent       DATETIME2 (7)
                                         , updatenum        INT
                                         , nosend           BIT
                                         , hidden           BIT
                                         , security_level   INT
                                         , review           BIT
                                         , Q1               NVARCHAR (50)
                                         , Q2               NVARCHAR (50)
                                         , Q3               NVARCHAR (50)
                                         , iAnswer          NVARCHAR (50)
                                         , ipMac            NVARCHAR (100)
                                         , frequency_id     INT
                                         , refer            INT
                                         , is_active        BIT
                                         , TimeZone         NVARCHAR (35)
                                         , usesDaylight     BIT
                                         , TzOffset         INT
                                         , iDefault_Quota   INT
                                         , iDoc_Usage       DECIMAL (10,0)
                                         , assist_id        INT
                                         , layout           INT
                                         , bTOS             BIT
                                         , bOnlineNow       BIT
                                         , uID              UNIQUEIDENTIFIER
                                         , iwkgrplayout     INT
                                         , sAboutMe         NVARCHAR (500)
                                         , folder_id        INT
                                         , signature        NVARCHAR (2500)
                                         , dateAdded        DATETIME2 (7)
                                         , addedBy          INT
                                         , bAuditLock       BIT
                                         , bProfileUpdate   BIT
                                         , bexpirereminder  BIT
                                         , bPingSent        BIT
                                         , dPingDate        DATETIME2 (7)
                                         , bVerified        BIT
                                         , iVerifiedBy      INT
                                         , dVerifiedDate    DATETIME2 (7)
                                         , inetwork         INT
                                         , isSuspect        BIT
                                         , systemID         INT
                                         , contactID        UNIQUEIDENTIFIER     DEFAULT NEWSEQUENTIALID()
                                         , createdByID      UNIQUEIDENTIFIER
                                         , updatedByID      UNIQUEIDENTIFIER
                                         , verifiedByID     UNIQUEIDENTIFIER ) ;


/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ;  -- Load temp storage with shredded XML data

    INSERT  @sourceData
          ( legacyID
          , Salutation
          , JobTitle
          , Firstname
          , Initial
          , Lastname
          , Suffix
          , Email
          , Login
          , Password
          , salt
          , AccessID
          , Expires
          , Hits
          , LastLogin
          , Status
          , ModifiedBy
          , DateModified
          , datejoined
          , membertype
          , photo
          , resume
          , thumb
          , PIN
          , reset
          , mailsent
          , sysmember
          , maildate
          , updatesent
          , updatenum
          , nosend
          , hidden
          , security_level
          , review
          , Q1
          , Q2
          , Q3
          , iAnswer
          , ipMac
          , frequency_id
          , refer
          , is_active
          , TimeZone
          , usesDaylight
          , TzOffset
          , iDefault_Quota
          , iDoc_Usage
          , assist_id
          , layout
          , bTOS
          , bOnlineNow
          , uID
          , iwkgrplayout
          , sAboutMe
          , folder_id
          , signature
          , dateAdded
          , addedBy
          , bAuditLock
          , bProfileUpdate
          , bexpirereminder
          , bPingSent
          , dPingDate
          , bVerified
          , iVerifiedBy
          , dVerifiedDate
          , inetwork
          , isSuspect
          , systemID )
    SELECT  row.data.value('@id[1]',              'int')
          , row.data.value('@Salutation[1]',      'nvarchar(20)')
          , row.data.value('@JobTitle[1]',        'nvarchar(255)')
          , row.data.value('@Firstname[1]',       'nvarchar(50)')
          , row.data.value('@Initial[1]',         'nvarchar(50)')
          , row.data.value('@Lastname[1]',        'nvarchar(50)')
          , row.data.value('@Suffix[1]',          'nvarchar(20)')
          , row.data.value('@Email[1]',           'nvarchar(50)')
          , row.data.value('@Login[1]',           'nvarchar(50)')
          , row.data.value('@Password[1]',        'nvarchar(500)')
          , row.data.value('@salt[1]',            'nvarchar(35)')
          , row.data.value('@AccessID[1]',        'int')
          , row.data.value('@Expires[1]',         'datetime2')
          , row.data.value('@Hits[1]',            'int')
          , row.data.value('@LastLogin[1]',       'datetime2')
          , row.data.value('@Status[1]',          'nvarchar(20)')
          , row.data.value('@ModifiedBy[1]',      'int')
          , row.data.value('@DateModified[1]',    'datetime2')
          , row.data.value('@datejoined[1]',      'datetime2')
          , row.data.value('@membertype[1]',      'int')
          , row.data.value('@photo[1]',           'nvarchar(120)')
          , row.data.value('@resume[1]',          'nvarchar(120)')
          , row.data.value('@thumb[1]',           'nvarchar(120)')
          , row.data.value('@PIN[1]',             'int')
          , row.data.value('@reset[1]',           'bit')
          , row.data.value('@mailsent[1]',        'bit')
          , row.data.value('@sysmember[1]',       'int')
          , row.data.value('@maildate[1]',        'datetime2')
          , row.data.value('@updatesent[1]',      'datetime2')
          , row.data.value('@updatenum[1]',       'int')
          , row.data.value('@nosend[1]',          'bit')
          , row.data.value('@hidden[1]',          'bit')
          , row.data.value('@security_level[1]',  'int')
          , row.data.value('@review[1]',          'bit')
          , row.data.value('@Q1[1]',              'nvarchar(50)')
          , row.data.value('@Q2[1]',              'nvarchar(50)')
          , row.data.value('@Q3[1]',              'nvarchar(50)')
          , row.data.value('@iAnswer[1]',         'nvarchar(50)')
          , row.data.value('@ipMac[1]',           'nvarchar(100)')
          , row.data.value('@frequency_id[1]',    'int')
          , row.data.value('@refer[1]',           'int')
          , row.data.value('@is_active[1]',       'bit')
          , row.data.value('@TimeZone[1]',        'nvarchar(35)')
          , row.data.value('@usesDaylight[1]',    'bit')
          , row.data.value('@TzOffset[1]',        'int')
          , row.data.value('@iDefault_Quota[1]',  'int')
          , row.data.value('@iDoc_Usage[1]',      'decimal')
          , row.data.value('@assist_id[1]',       'int')
          , row.data.value('@layout[1]',          'int')
          , row.data.value('@bTOS[1]',            'bit')
          , row.data.value('@bOnlineNow[1]',      'bit')
          , row.data.value('@uID[1]',             'uniqueidentifier')
          , row.data.value('@iwkgrplayout[1]',    'int')
          , row.data.value('@sAboutMe[1]',        'nvarchar(500)')
          , row.data.value('@folder_id[1]',       'int')
          , row.data.value('@signature[1]',       'nvarchar(2500)')
          , row.data.value('@dateAdded[1]',       'datetime2')
          , row.data.value('@addedBy[1]',         'int')
          , row.data.value('@bAuditLock[1]',      'bit')
          , row.data.value('@bProfileUpdate[1]',  'bit')
          , row.data.value('@bexpirereminder[1]', 'bit')
          , row.data.value('@bPingSent[1]',       'bit')
          , row.data.value('@dPingDate[1]',       'datetime2')
          , row.data.value('@bVerified[1]',       'bit')
          , row.data.value('@iVerifiedBy[1]',     'int')
          , row.data.value('@dVerifiedDate[1]',   'datetime2')
          , row.data.value('@inetwork[1]',        'int')
          , row.data.value('@isSuspect[1]',       'bit')
          , @systemID
      FROM  @dataXML.nodes('row/data') AS row(data) ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, '@dataXML INSERT', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc02 ;  -- SELECT legacyID for new records

    SELECT  @legacyID = COALESCE( MAX( mc_contactID ), 0 )
      FROM  dbo.ContactSystems WHERE systemID = @systemID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ;  -- UPDATE temporary storage with legacyID

    UPDATE  @sourceData
       SET  @legacyID = legacyID = @legacyID + 1
     WHERE  legacyID IS NULL ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ;  -- UPDATE temporary storage with contactID when emails match

      WITH  existingContacts AS (
            SELECT contactID, email, N = ROW_NUMBER() OVER ( PARTITION BY contactID, email ORDER BY lastLogin DESC )
              FROM Core.mc_contact AS con
             WHERE EXISTS ( SELECT 1 FROM @sourceData AS src where src.email = con.email ) )
    UPDATE  @sourceData
       SET  contactID = ext.contactID
      FROM  @sourceData         AS src
INNER JOIN  existingContacts    AS ext ON ext.email = src.email
     WHERE  ext.N = 1 ;


/**/SELECT  @codeBlockNum   = 5
/**/      , @codeBlockDesc  = @codeBlockDesc05 ;  -- MERGE temporary storage into dbo.Contacts

     MERGE  dbo.Contacts    AS tgt
     USING  @sourceData     AS src ON src.contactID = tgt.ID
      WHEN  MATCHED THEN
            UPDATE  SET salutation      = src.Salutation
                      , jobTitle        = src.JobTitle
                      , firstName       = src.Firstname
                      , middleInitial   = src.Initial
                      , lastName        = src.Lastname
                      , suffix          = src.Suffix
                      , email           = src.Email
                      , userLogin       = src.Login
                      , userPassword    = src.Password
                      , salt            = src.salt
                      , photo           = src.photo
                      , resume          = src.resume
                      , thumb           = src.thumb
                      , PIN             = src.PIN
                      , reset           = src.reset
                      , mailsent        = src.mailsent
                      , maildate        = src.maildate
                      , updatenum       = src.updatenum
                      , updatesent      = src.updatesent
                      , nosend          = src.nosend
                      , review          = src.review
                      , Q1              = src.Q1
                      , Q2              = src.Q2
                      , Q3              = src.Q3
                      , iAnswer         = src.iAnswer
                      , ipMac           = src.ipMac
                      , frequencyID     = src.frequency_id
                      , refer           = src.refer
                      , isActive        = src.is_active
                      , timezone        = src.TimeZone
                      , usesDaylight    = src.usesDaylight
                      , tzOffset        = src.TzOffset
                      , iDefaultQuota   = src.iDefault_Quota
                      , iDocUsage       = src.iDoc_Usage
                      , assistID        = src.assist_id
                      , layout          = src.layout
                      , bTOS            = src.bTOS
                      , bOnlineNow      = src.bOnlineNow
                      , uID             = src.uID
                      , workgroupLayout = src.iwkgrplayout
                      , aboutMe         = src.sAboutMe
                      , signature       = src.signature
                      , bAuditLock      = src.bAuditLock
                      , bProfileUpdate  = src.bProfileUpdate
                      , bExpireReminder = src.bexpirereminder
                      , bPingSent       = src.bPingSent
                      , dPingDate       = src.dPingDate
                      , bVerified       = src.bVerified
                      , verifiedOn      = src.dVerifiedDate
                      , iNetwork        = src.inetwork
                      , isSuspect       = ISNULL( src.isSuspect, 0 )
                      , createdOn       = src.dateAdded
                      , updatedOn       = src.DateModified
      WHEN  NOT MATCHED BY TARGET THEN 
            INSERT  ( ID, salutation, jobTitle, firstName, middleInitial, lastName
                        , suffix, email, userLogin, userPassword, salt, photo
                        , resume, thumb, PIN, reset, mailsent, maildate
                        , updatenum, updatesent, nosend, review, Q1, Q2, Q3
                        , iAnswer, ipMac, frequencyID, refer, isActive, timezone
                        , usesDaylight, tzOffset, iDefaultQuota, iDocUsage, assistID
                        , layout, bTOS, bOnlineNow, uID, workgroupLayout
                        , aboutMe, signature, bAuditLock, bProfileUpdate
                        , bExpireReminder, bPingSent, dPingDate, bVerified
                        , verifiedOn, iNetwork, isSuspect, createdOn, updatedOn )
            VALUES  ( contactID, src.Salutation, src.JobTitle, src.Firstname, src.Initial, src.Lastname
                        , src.Suffix, src.Email, src.Login, src.Password, src.salt, src.photo
                        , src.resume, src.thumb, src.PIN, src.reset, src.mailsent, src.maildate
                        , src.updatenum, src.updatesent, src.nosend, src.review, src.Q1, src.Q2, src.Q3
                        , src.iAnswer, src.ipMac, src.frequency_id, src.refer, src.is_active, src.TimeZone
                        , src.usesDaylight, src.TzOffset, src.iDefault_Quota, src.iDoc_Usage, src.assist_id
                        , src.layout, src.bTOS, src.bOnlineNow, src.uID, src.iwkgrplayout
                        , src.sAboutMe, src.signature, src.bAuditLock, src.bProfileUpdate
                        , src.bexpirereminder, src.bPingSent, src.dPingDate, src.bVerified
                        , src.dVerifiedDate, src.inetwork, ISNULL( src.isSuspect, 0 ), src.dateAdded, src.DateModified ) ;
    SELECT  @controlCount = @@ROWCOUNT ;

    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'Contacts MERGE', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 6
/**/      , @codeBlockDesc  = @codeBlockDesc06 ;  -- INSERT into dbo.ContactSystems FROM temp storage

    INSERT  dbo.ContactSystems (
            ID, systemID, accessID, expiresOn, numberOfHits, lastLoginOn
                , status, joinedOn, memberType, sysmember, isHidden
                , securityLevel, folderID, createdOn, updatedOn, mc_contactID )
    SELECT  contactID, systemID, AccessID, Expires, Hits, LastLogin
                , Status, datejoined, membertype, sysmember, hidden
                , security_level, folder_id, dateAdded, DateModified, legacyID
      FROM  @sourceData ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'ContactSystems INSERTs', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 7
/**/      , @codeBlockDesc  = @codeBlockDesc07 ;  -- UPDATE temp storage from dbo.ContactSystems

    UPDATE  @sourceData
       SET  createdByID     = cn1.ID
          , updatedByID     = cn2.ID
          , verifiedByID    = cn3.ID
      FROM  @sourceData         AS src
 LEFT JOIN  dbo.ContactSystems  AS cn1 ON cn1.mc_contactID = src.addedBy     AND cn1.systemID = src.systemID
 LEFT JOIN  dbo.ContactSystems  AS cn2 ON cn2.mc_contactID = src.ModifiedBy  AND cn2.systemID = src.systemID
 LEFT JOIN  dbo.ContactSystems  AS cn3 ON cn3.mc_contactID = src.iVerifiedBy AND cn3.systemID = src.systemID ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, '@sourceData UPDATE', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 8
/**/      , @codeBlockDesc  = @codeBlockDesc08 ;  -- UPDATE dbo.Contacts from temp storage with createdBy and updatedBy

    UPDATE  dbo.Contacts
       SET  createdBy   = createdByID
          , updatedBy   = updatedByID
          , verifiedBy  = verifiedByID
      FROM  @sourceData   AS src
INNER JOIN  dbo.Contacts  AS cnt ON cnt.ID = src.contactID ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'dbo.Contacts UPDATE', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 9
/**/      , @codeBlockDesc  = @codeBlockDesc09 ;  -- UPDATE dbo.ContactSystems from temp storage with createdBy and updatedBy

    UPDATE  dbo.ContactSystems
       SET  createdBy   = createdByID
          , updatedBy   = updatedByID
      FROM  @sourceData         AS src
INNER JOIN  dbo.ContactSystems  AS cns ON cns.ID = src.contactID AND cns.systemID = src.systemID ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'dbo.ContactSystems UPDATE', @controlCount ) ;


END TRY
BEGIN CATCH
    SELECT  @errorData = '<b>trigger data passed into coreShield</b></br></br>'
                       + '<table border="1">'
                       + '<tr><th>ID</th><th>Salutation</th><th>JobTitle</th><th>Firstname</th>'
                       + '<th>Initial</th><th>Lastname</th><th>Suffix</th><th>Email</th><th>Login</th>'
                       + '<th>Password</th><th>salt</th><th>AccessID</th><th>Expires</th><th>Hits</th>'
                       + '<th>LastLogin</th><th>Status</th><th>ModifiedBy</th><th>DateModified</th>'
                       + '<th>datejoined</th><th>membertype</th><th>photo</th><th>resume</th><th>thumb</th>'
                       + '<th>PIN</th><th>reset</th><th>mailsent</th><th>sysmember</th><th>maildate</th>'
                       + '<th>updatesent</th><th>updatenum</th><th>nosend</th><th>hidden</th><th>security_level</th>'
                       + '<th>review</th><th>Q1</th><th>Q2</th><th>Q3</th><th>iAnswer</th><th>ipMac</th>'
                       + '<th>frequency_id</th><th>refer</th><th>is_active</th><th>TimeZone</th><th>usesDaylight</th>'
                       + '<th>TzOffset</th><th>iDefault_Quota</th><th>iDoc_Usage</th><th>assist_id</th><th>layout</th>'
                       + '<th>bTOS</th><th>bOnlineNow</th><th>uID</th><th>iwkgrplayout</th><th>sAboutMe</th>'
                       + '<th>folder_id</th><th>signature</th><th>dateAdded</th><th>addedBy</th><th>bAuditLock</th>'
                       + '<th>bProfileUpdate</th><th>bexpirereminder</th><th>bPingSent</th><th>dPingDate</th>'
                       + '<th>bVerified</th><th>iVerifiedBy</th><th>dVerifiedDate</th><th>inetwork</th>'
                       + '<th>isSuspect</th><th>systemID</th><th>contactID</th><th>createdByID</th>'
                       + '<th>updatedByID</th><th>verifiedByID</th></tr>'
                       + CAST ( ( SELECT  td = legacyID, ''
                                       ,  td = Salutation, ''
                                       ,  td = JobTitle, ''
                                       ,  td = Firstname, ''
                                       ,  td = Initial, ''
                                       ,  td = Lastname, ''
                                       ,  td = Suffix, ''
                                       ,  td = Email, ''
                                       ,  td = Login, ''
                                       ,  td = Password, ''
                                       ,  td = salt, ''
                                       ,  td = AccessID, ''
                                       ,  td = Expires, ''
                                       ,  td = Hits, ''
                                       ,  td = LastLogin, ''
                                       ,  td = Status, ''
                                       ,  td = ModifiedBy, ''
                                       ,  td = DateModified, ''
                                       ,  td = datejoined, ''
                                       ,  td = membertype, ''
                                       ,  td = photo, ''
                                       ,  td = resume, ''
                                       ,  td = thumb, ''
                                       ,  td = PIN, ''
                                       ,  td = reset, ''
                                       ,  td = mailsent, ''
                                       ,  td = sysmember, ''
                                       ,  td = maildate, ''
                                       ,  td = updatesent, ''
                                       ,  td = updatenum, ''
                                       ,  td = nosend, ''
                                       ,  td = hidden, ''
                                       ,  td = security_level, ''
                                       ,  td = review, ''
                                       ,  td = Q1, ''
                                       ,  td = Q2, ''
                                       ,  td = Q3, ''
                                       ,  td = iAnswer, ''
                                       ,  td = ipMac, ''
                                       ,  td = frequency_id, ''
                                       ,  td = refer, ''
                                       ,  td = is_active, ''
                                       ,  td = TimeZone, ''
                                       ,  td = usesDaylight, ''
                                       ,  td = TzOffset, ''
                                       ,  td = iDefault_Quota, ''
                                       ,  td = iDoc_Usage, ''
                                       ,  td = assist_id, ''
                                       ,  td = layout, ''
                                       ,  td = bTOS, ''
                                       ,  td = bOnlineNow, ''
                                       ,  td = uID, ''
                                       ,  td = iwkgrplayout, ''
                                       ,  td = sAboutMe, ''
                                       ,  td = folder_id, ''
                                       ,  td = signature, ''
                                       ,  td = dateAdded, ''
                                       ,  td = addedBy, ''
                                       ,  td = bAuditLock, ''
                                       ,  td = bProfileUpdate, ''
                                       ,  td = bexpirereminder, ''
                                       ,  td = bPingSent, ''
                                       ,  td = dPingDate, ''
                                       ,  td = bVerified, ''
                                       ,  td = iVerifiedBy, ''
                                       ,  td = dVerifiedDate, ''
                                       ,  td = inetwork, ''
                                       ,  td = isSuspect, ''
                                       ,  td = systemID, ''
                                       ,  td = contactID, ''
                                       ,  td = createdByID, ''
                                       ,  td = updatedByID, ''
                                       ,  td = verifiedByID, ''
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