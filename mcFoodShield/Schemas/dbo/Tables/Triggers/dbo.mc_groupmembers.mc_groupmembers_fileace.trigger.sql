CREATE TRIGGER [dbo].[mc_groupmembers_fileace]
   ON [dbo].[mc_groupmembers]
   AFTER INSERT,DELETE
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @operation	AS NVARCHAR(50) ;
	DECLARE @rc			AS INT ;

	CREATE TABLE #mc_groupmembers_temp (
		[ID] [int] NOT NULL
		, [GroupID] [int] NULL
		, [ForeignKeyID] [int] NULL
		, [Type] [nvarchar](50) NULL
		, [Role] [int] NULL
		, [Accepted] [int] NOT NULL
		, [MemberTypeID] [int] NOT NULL
		, [externalGroupID] [int] NOT NULL
		, [relatedGroupID] [int] NOT NULL
		, [Expires] [datetime2](0) NULL
		, [DateAdded] [datetime2](0) NULL
		, [groupLevel] [int] NOT NULL
		, [RoleExpires] [datetime2](0) NULL
		, [Term_ID] [int] NOT NULL
		, [ivisits] [int] NOT NULL
		, [dtlastaccessdate] [date] NULL )
		
	
	IF EXISTS (	SELECT * FROM inserted ) 
		BEGIN 
			SET @operation = N'INSERT' ; 
			INSERT INTO #mc_groupmembers_temp SELECT * FROM inserted ;			
		END
	ELSE
		BEGIN 
			SET @operation = N'DELETE'; 
			INSERT INTO #mc_groupmembers_temp SELECT * FROM deleted ;			
		END
		
	EXEC @rc = [dbo].[spGroupMemberFileace]
		@operation = @operation ;	
		
	IF @rc <> 0
		RAISERROR ('Trigger Failure', 16, 0) ;	

END