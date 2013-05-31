CREATE PROCEDURE dbo.mc_org_locationUPDATE ( @systemID     AS INT
                                           , @recordsIN    AS INT
                                           , @dataXML      AS XML
                                           , @errorMessage AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************

  Procedure:  dbo.mc_org_locationUPDATE
     Author:  Chris Carson
    Purpose:  UPDATEs portal view data for dbo.OrgLocations and related tables on coreSHIELD

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2013-03-05      created


    Logic Summary:
    1)  Load temp storage with shredded XML data
    2)  UPDATE temp storage with coreSHIELD related IDs
    3)  UPDATE dbo.OrgLocations from temp storage
    4)  UPDATE dbo.OrgLocationSystems from temp storage


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
          , @codeBlockDesc03    AS NVARCHAR (128)   = 'UPDATE dbo.OrgLocations from temp storage'
          , @codeBlockDesc04    AS NVARCHAR (128)   = 'UPDATE dbo.OrgLocationSystems from temp storage' ;

    DECLARE @controlCount       AS INT
          , @controlTotalsError AS NVARCHAR(200)    = N'Control Total Failure:  %s = %d, %s = %d' ;


    DECLARE @sourceData         AS TABLE ( legacyID             INT
                                         , org_id               INT
                                         , addressTypeID        INT
                                         , name                 NVARCHAR(75)
                                         , address1             NVARCHAR(200)
                                         , address2             NVARCHAR(200)
                                         , address3             NVARCHAR(200)
                                         , city                 NVARCHAR(50)
                                         , state                NVARCHAR(50)
                                         , zip                  NVARCHAR(10)
                                         , d_phone              NVARCHAR(25)
                                         , d_fax                NVARCHAR(25)
                                         , active               BIT
                                         , notes                NVARCHAR(500)
                                         , country              NVARCHAR(20)
                                         , d_emergency_phone    NVARCHAR(25)
                                         , d_24hr_phone         NVARCHAR(25)
                                         , d_infectious_phone   NVARCHAR(25)
                                         , bAlternate           BIT
                                         , date_added           DATETIME2 (7)
                                         , date_updated         DATETIME2 (7)
                                         , systemID             INT
                                         , orgLocationID        UNIQUEIDENTIFIER
                                         , organizationID       UNIQUEIDENTIFIER  ) ;


/**/SELECT  @codeBlockNum   = 1
/**/      , @codeBlockDesc  = @codeBlockDesc01 ; --  Load temp storage with shredded XML data

    INSERT  @sourceData
          ( legacyID
          , org_id
          , addressTypeID
          , name
          , address1
          , address2
          , address3
          , city
          , state
          , zip
          , d_phone
          , d_fax
          , active
          , notes
          , country
          , d_emergency_phone
          , d_24hr_phone
          , d_infectious_phone
          , bAlternate
          , date_added
          , date_updated
          , systemID )
    SELECT  row.data.value( '@id[1]',                 'int')
          , row.data.value( '@org_id[1]',             'int' )
          , row.data.value( '@addressTypeID[1]',      'int' )
          , row.data.value( '@name[1]',               'nvarchar(75)' )
          , row.data.value( '@address1[1]',           'nvarchar(200)' )
          , row.data.value( '@address2[1]',           'nvarchar(200)' )
          , row.data.value( '@address3[1]',           'nvarchar(200)' )
          , row.data.value( '@city[1]',               'nvarchar(50)' )
          , row.data.value( '@state[1]',              'nvarchar(50)' )
          , row.data.value( '@zip[1]',                'nvarchar(10)' )
          , row.data.value( '@d_phone[1]',            'nvarchar(25)' )
          , row.data.value( '@d_fax[1]',              'nvarchar(25)' )
          , row.data.value( '@active[1]',             'bit' )
          , row.data.value( '@notes[1]',              'nvarchar(500)' )
          , row.data.value( '@country[1]',            'nvarchar(20)' )
          , row.data.value( '@d_emergency_phone[1]',  'nvarchar(25)' )
          , row.data.value( '@d_24hr_phone[1]',       'nvarchar(25)' )
          , row.data.value( '@d_infectious_phone[1]', 'nvarchar(25)' )
          , row.data.value( '@bAlternate[1]',         'bit' )
          , row.data.value( '@date_added[1]',         'datetime2' )
          , row.data.value( '@date_updated[1]',       'datetime2' )
          , @systemID
      FROM  @dataXML.nodes( 'row/data' ) AS row( data ) ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, '@dataXML INSERT', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 2
/**/      , @codeBlockDesc  = @codeBlockDesc02 ; --  UPDATE temp storage with coreSHIELD related IDs

    UPDATE  @sourceData
       SET  organizationID  = ogs.ID
          , orgLocationID   = ols.ID
      FROM  @sourceData             AS src
INNER JOIN  dbo.OrganizationSystems AS ogs ON ogs.mc_organizationID = src.org_id   AND ogs.systemID = src.systemID
INNER JOIN  dbo.OrgLocationSystems  AS ols ON ols.mc_org_locationID = src.legacyID AND ols.systemID = src.systemID ;


/**/SELECT  @codeBlockNum   = 3
/**/      , @codeBlockDesc  = @codeBlockDesc03 ; --  UPDATE dbo.OrgLocations from temp storage

    UPDATE  dbo.OrgLocations
       SET  organizationID   = src.organizationID
          , addressTypeID    = src.addressTypeID
          , name             = src.name
          , address1         = src.address1
          , address2         = src.address2
          , address3         = src.address3
          , city             = src.city
          , state            = src.state
          , zip              = src.zip
          , phone            = src.d_phone
          , fax              = src.d_fax
          , isActive         = src.active
          , notes            = src.notes
          , country          = src.country
          , emergencyPhone   = src.d_emergency_phone
          , allHoursPhone    = src.d_24hr_phone
          , infectiousPhone  = src.d_infectious_phone
          , isAlternate      = src.bAlternate
          , createdOn        = src.date_added
          , updatedOn        = src.date_updated
      FROM  dbo.OrgLocations AS ogl
INNER JOIN  @sourceData      AS src ON src.orgLocationID = ogl.ID ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'OrgLocation UPDATEs', @controlCount ) ;


/**/SELECT  @codeBlockNum   = 4
/**/      , @codeBlockDesc  = @codeBlockDesc04 ; --  UPDATE dbo.OrgLocationSystems from temp storage

    UPDATE  dbo.OrgLocationSystems
       SET  createdOn   = src.date_added
          , updatedOn   = src.date_updated
      FROM  dbo.OrgLocationSystems AS ols
INNER JOIN  @sourceData            AS src ON src.orgLocationID = ols.ID AND src.systemID = ols.systemID ;

    SELECT  @controlCount = @@ROWCOUNT ;
    IF  ( @recordsIN <> @controlCount )
        RAISERROR( @controlTotalsError, 16, 1, 'Records IN', @recordsIN, 'OrgLocationSystems UPDATEs', @controlCount ) ;


END TRY
BEGIN CATCH
    SELECT  @errorData = '<b>trigger data passed into coreShield</b></br></br>'
                       + '<table border="1">'
                       + '<tr><th>legacyID</th><th>org_id</th><th>addressTypeID</th><th>name</th>'
                       + '<th>address1</th><th>address2</th><th>address3</th><th>city</th>'
                       + '<th>state</th><th>zip</th><th>d_phone</th><th>d_fax</th><th>active</th>'
                       + '<th>notes</th><th>country</th><th>d_emergency_phone</th><th>d_24hr_phone</th>'
                       + '<th>d_infectious_phone</th><th>bAlternate</th><th>date_added</th><th>date_updated</th>'
                       + '<th>systemID</th><th>orgLocationID</th><th>organizationID</th></tr>'
                       + CAST ( ( SELECT  td = legacyID, ''
                                        , td = org_id, ''
                                        , td = addressTypeID, ''
                                        , td = name, ''
                                        , td = address1, ''
                                        , td = address2, ''
                                        , td = address3, ''
                                        , td = city, ''
                                        , td = state, ''
                                        , td = zip, ''
                                        , td = d_phone, ''
                                        , td = d_fax, ''
                                        , td = active, ''
                                        , td = notes, ''
                                        , td = country, ''
                                        , td = d_emergency_phone, ''
                                        , td = d_24hr_phone, ''
                                        , td = d_infectious_phone, ''
                                        , td = bAlternate, ''
                                        , td = date_added, ''
                                        , td = date_updated, ''
                                        , td = systemID, ''
                                        , td = orgLocationID, ''
                                        , td = organizationID, ''
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