-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.getFilesByLocation (
	@searchTerms AS NVARCHAR(500) ) 
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql AS NVARCHAR(1000);
	DECLARE @sTable TABLE ( pattern NVARCHAR(500) ) ;
	
	SET @sql = 'SELECT ''%' + REPLACE(@searchTerms, ',','%'' UNION SELECT ''%') + '%'';' ;

	INSERT INTO @sTable EXEC ( @sql ) ;
	
	SELECT * FROM @sTable ;

END