CREATE PROCEDURE [dbo].[spAddReport] 
	@title AS NVARCHAR(100) = NULL
	, @instructions AS NVARCHAR(max) = NULL
	, @responseIDLabel AS NVARCHAR(100) = NULL
	, @isActive AS BIT = NULL
	, @cdCreatedOn AS DATETIME2 = NULL
	, @cdCreatedBy AS INT = NULL
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @createTS AS DATETIME2;
	
	SET @createTS = GETDATE();

	INSERT INTO PETnetReporting.dbo.Reports ( 
		title, instructions, responseIDLabel
		, isActive, cdCreatedBy, cdCreatedOn )

	VALUES (
		@title, @instructions, @responseIDLabel
		, @isActive, @cdCreatedBy, @createTS )
		
	SELECT r.reportsID
	FROM PETnetReporting.dbo.Reports AS r
	WHERE title = @title AND
		cdCreatedBy = @cdCreatedBy AND
		cdCreatedOn = @createTS ; 
		
	RETURN;

END