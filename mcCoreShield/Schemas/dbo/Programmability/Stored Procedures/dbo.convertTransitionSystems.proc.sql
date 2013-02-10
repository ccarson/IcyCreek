CREATE PROCEDURE [dbo].[convertTransitionSystems]
	@systemName AS NVARCHAR(50)
	, @dbName AS NVARCHAR(50)
AS
BEGIN

	SET NOCOUNT ON;
	
	/* add new records to transitionSystems */
	DECLARE @systemID AS INT;
	DECLARE @sql AS NVARCHAR(4000);
	
	
/*	Conversion for transitionSystems Table

	I. If system has already been converted at some point:
			return corresponding systemID
			
	II.	If system has not ever been converted:
			create new record on transitionSystems
			create synonym for transitionSystems on target database
			return corresponding systemID

*/
	
	SET @systemID = (
		SELECT id 
		FROM dbo.transitionSystems 
		WHERE systemName = @systemName );
		
	IF @systemID IS NULL
	BEGIN
		SET @systemID = ( 
			SELECT COALESCE(MAX(id), 0) + 1 
			FROM dbo.transitionSystems );
		INSERT INTO dbo.transitionSystems ( 
			id, systemName )
		SELECT @systemID, @systemName ;
		
		SET @sql = N'
			USE [' + @dbname + N'] ; 
			EXEC ( ''CREATE SYNONYM dbo.transitionSystems FOR mcCoreShield.dbo.transitionSystems'' );'
		
		EXECUTE sp_executeSQL @sql;
	END
	
	RETURN @systemID;

END
