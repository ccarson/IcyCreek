CREATE PROCEDURE [dbo].[loadVfcFileKeywords]  (
	@fileID AS UNIQUEIDENTIFIER, 
	@keywords AS NVARCHAR(max) )
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @sql AS NVARCHAR(max);
	DECLARE @sqlChunk AS NVARCHAR(MAX);
	declare @newStart as bigint;
    DECLARE @keywordTable TABLE (
		 keyword	NVARCHAR(400),
		 wordCount  INTEGER);
		 
	SET @keywords = REPLACE(@keywords, N' ', N'');
		 
	SET @sql = 'SELECT ' + REPLACE(@keywords, ',',' UNION SELECT ');
	
	SET @sql = REPLACE(@sql, ':',''', ');

	SET @sql = REPLACE(@sql, ''' ',' ');
	
	SET @sql = REPLACE(@sql, 'SELECT ', 'SELECT ''');
	
	WHILE ( len(@sql) > 1000 )
	BEGIN
		print @sql;
		SET @newStart = charindex(N' UNION SELECT',@sql, 1000)
		print @newStart;
		SET @sqlChunk = left(@sql, @newStart);
		print @sqlChunk;
		SET @sql = substring(@sql, @newStart + 7, len(@sql));
		INSERT INTO @keywordTable EXEC ( @sqlChunk ) ;
	END
	
	--print @sql;
	
	INSERT INTO @keywordTable EXEC ( @sql ) ;
	
	DELETE dbo.vfc_file_keywords
	FROM dbo.vfc_file_keywords AS f
	WHERE f.fileID = @fileID ; 

	INSERT INTO dbo.vfc_file_keywords (
		fileID, keyword, wordCount )
    SELECT @fileID, k.keyword, k.wordCount
    FROM @keywordTable AS k ;
    
    --select * from @keywordTable ;

	RETURN;

END