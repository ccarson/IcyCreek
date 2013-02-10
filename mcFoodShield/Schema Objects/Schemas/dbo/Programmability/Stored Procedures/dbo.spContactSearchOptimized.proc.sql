CREATE PROCEDURE [dbo].[spContactSearchOptimized] 
	@lastname NVARCHAR(75) = NULL 
	, @email NVARCHAR(75) = NULL
	, @jobTitle NVARCHAR(100) = NULL
	, @state NVARCHAR(75) = NULL
	, @useCarroll INT = 0
AS
BEGIN
	SET NOCOUNT ON;

    IF @lastname IS NOT NULL
        SET @lastname = @lastname + N'%' ;
    
    IF @email IS NOT NULL
        SET @email = @email + N'%' ;

    IF @jobTitle IS NOT NULL
        SET @jobTitle = @jobTitle + N'%' ;
        
    CREATE TABLE #results (
           [ID] [int] NOT NULL
         , [Salutation] [nvarchar](20) NULL
         , [JobTitle] [nvarchar](255) NULL
         , [Firstname] [nvarchar](50) NULL
         , [Initial] [nvarchar](50) NULL
         , [Lastname] [nvarchar](50) NULL
         , [Suffix] [nvarchar](20) NULL
         , [Email] [nvarchar](50) NULL
         , [Login] [nvarchar](50) NULL
         , [Password] [nvarchar](500) NULL
         , [salt] [nvarchar](35) NULL
         , [AccessID] [int] NOT NULL
         , [Expires] [datetime2](0) NULL
         , [Hits] [int] NULL
         , [LastLogin] [datetime2](0) NULL
         , [Status] [nvarchar](20) NULL
         , [ModifiedBy] [nvarchar](50) NULL
         , [DateModified] [datetime2](0) NULL
         , [datejoined] [datetime2](0) NULL
         , [membertype] [int] NULL
         , [photo] [nvarchar](120) NULL
         , [resume] [nvarchar](120) NULL
         , [thumb] [nvarchar](120) NULL
         , [PIN] [int] NULL
         , [reset] [bit] NULL
         , [mailsent] [bit] NULL
         , [sysmember] [int] NULL
         , [maildate] [datetime2](0) NULL
         , [updatesent] [datetime2](0) NULL
         , [updatenum] [int] NULL
         , [nosend] [bit] NULL
         , [hidden] [bit] NOT NULL
         , [security_level] [int] NOT NULL
         , [review] [bit] NOT NULL
         , [Q1] [nvarchar](50) NULL
         , [Q2] [nvarchar](50) NULL
         , [Q3] [nvarchar](50) NULL
         , [iAnswer] [nvarchar](50) NULL
         , [ipMac] [nvarchar](100) NULL
         , [frequency_id] [int] NULL
         , [refer] [int] NOT NULL
         , [is_active] [bit] NULL
         , [TimeZone] [nvarchar](35) NULL
         , [usesDaylight] [bit] NOT NULL
         , [TzOffset] [nvarchar](10) NULL
         , [iDefault_Quota] [int] NOT NULL
         , [iDoc_Usage] [decimal](10, 0) NOT NULL
         , [assist_id] [int] NOT NULL
         , [layout] [int] NOT NULL
         , [bTOS] [bit] NULL
         , [bOnlineNow] [bit] NULL
         , [uID] [nvarchar](35) NULL
         , [iwkgrplayout] [int] NOT NULL
         , [sAboutMe] [nvarchar](500) NULL
         , [folder_id] [int] NOT NULL
         , [signature] [nvarchar](MAX) NULL
         , [dateAdded] [datetime2](0) NULL
         , [addedBy] [int] NOT NULL
         , [bAuditLock] [bit] NOT NULL
         , [bProfileUpdate] [bit] NOT NULL
         , [bexpirereminder] [bit] NOT NULL
         , [bPingSent] [bit] NOT NULL
         , [dPingDate] [datetime2](0) NULL
         , [bVerified] [bit] NOT NULL
         , [iVerifiedBy] [int] NOT NULL
         , [dVerifiedDate] [datetime2](0) NULL
         , [inetwork] [int] NOT NULL ) ; 
         
    CREATE NONCLUSTERED INDEX [lName] ON #results ( Lastname ASC ) ;
    
    INSERT INTO #results 
    SELECT * 
    FROM dbo.mc_contact c
    WHERE Lastname LIKE ISNULL( @lastname, N'%' ) AND
        Email LIKE ISNULL( @email, N'%' ) AND
        JobTitle LIKE ISNULL( @jobTitle, N'%' ) AND EXISTS (
            SELECT * FROM dbo.mc_contact_addresses a
            WHERE c.ID = a.user_id AND a.state = ISNULL( @state, a.state )
            ) ;
    
   
    IF @useCarroll = 1
    INSERT INTO #results 
    SELECT * 
    FROM dbo.mc_contact_carroll c
    WHERE Lastname LIKE ISNULL( @lastname, N'%' ) AND
        Email LIKE ISNULL( @email, N'%' ) AND
        JobTitle LIKE ISNULL( @jobTitle, N'%' ) AND EXISTS (
            SELECT * FROM dbo.mc_contact_addresses_opt a
            INNER JOIN dbo.c_zip_opt z ON a.zip = z.id
            WHERE c.ID = a.user_id AND z.State = ISNULL( @state, z.state )
            ) ;
    
    SELECT TOP 50 * FROM #results ORDER BY Lastname ;
    
END

