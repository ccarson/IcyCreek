
CREATE PROCEDURE [__BuildMaster_ExecSql]
(
@Numeric_Release_Number BIGINT,
@Batch_Name NVARCHAR(50),

@Script_Id INT,
@Script_Sequence INT,
@Script_Sql NTEXT,

@Executed_Indicator CHAR(1) = 'N' OUT,
@Succeeded_Indicator CHAR(1) = NULL OUT

) AS BEGIN

SET NOCOUNT ON

SET @Executed_Indicator = 'N'

-- Validate Input
IF @Numeric_Release_Number IS NULL OR @Numeric_Release_Number < 0 OR
@Script_Id IS NULL OR @Script_Id < 1 OR
@Script_Sequence IS NULL OR @Script_Sequence < 0 OR
NULLIF(@Batch_Name,'') IS NULL OR
@Script_Sql IS NULL OR
@Script_Sql LIKE '' BEGIN
PRINT 'Script not run: no parameters may be null, empty, or less than zero.'
RETURN
END

-- Get Latest Schema Version
DECLARE @LatestVersion BIGINT
SET @LatestVersion = (SELECT MAX([Numeric_Release_Number]) FROM [__BuildMaster_DbSchemaChanges])

IF EXISTS(SELECT * FROM [__BuildMaster_DbSchemaChanges]
WHERE [Numeric_Release_Number] = @Numeric_Release_Number
AND [Script_Id] = @Script_Id
AND [Script_Sequence] = @Script_Sequence)
BEGIN
PRINT 'Script "' + @Batch_Name + '", Seq ' + CAST(@Script_Sequence AS VARCHAR(MAX))+ ' skipped: already ran.'
RETURN
END

-- Exec Script and run
EXEC sp_executesql @Script_Sql
IF @@ERROR=0 BEGIN
INSERT INTO [__BuildMaster_DbSchemaChanges]
([Numeric_Release_Number], [Script_Id], [Script_Sequence], [Batch_Name], [Executed_Date], [Success_Indicator])
VALUES
(@Numeric_Release_Number, @Script_Id, @Script_Sequence, @Batch_Name, GETDATE(), 'Y')
PRINT 'Script "' + @Batch_Name + '", Seq ' + CAST(@Script_Sequence AS VARCHAR(MAX))+ ' successfully.'
SET @Succeeded_Indicator = 'Y'
END ELSE BEGIN
INSERT INTO [__BuildMaster_DbSchemaChanges]
([Numeric_Release_Number], [Script_Id], [Script_Sequence], [Batch_Name], [Executed_Date], [Success_Indicator])
VALUES
(@Numeric_Release_Number, @Script_Id, @Script_Sequence, @Batch_Name, GETDATE(), 'N')
PRINT 'Script "' + @Batch_Name + '", Seq ' + CAST(@Script_Sequence AS VARCHAR(MAX))+ ' failed.'
SET @Succeeded_Indicator = 'N'
END
SET @Executed_Indicator = 'Y'
END