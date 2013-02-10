CREATE PROCEDURE [dbo].[mcOrganizationTree] 
	-- Add the parameters for the stored procedure here
	@startingOrgDept	INT 
	, @numberLevels		INT 
	, @includeParent	INT 
AS
BEGIN

	DECLARE @startingLevel as INT ;
	DECLARE @endingLevel as INT ; 
	DECLARE @startingParent as INT ;
	DECLARE @startingOrg as INT ;
	
	
	SET @startingParent = 0 ;
	
	
	IF ( @numberLevels = 0 )
	BEGIN
		SET @startingLevel = ( 0 )
		SET @startingParent = ( 0 )
		SET @startingOrg = (
			SELECT org_id from mc_org_departments 
			WHERE id = @startingOrgDept )
		SET @startingOrgDept = (
			SELECT id FROM mc_org_departments
			WHERE org_id = @startingOrg 
				AND org_level = 0 )
	END
	ELSE
	BEGIN
		SET @startingLevel = ( 
			SELECT org_level FROM mc_org_departments
			WHERE id = @startingOrgDept )
			
		IF (@includeParent = 1 )
		BEGIN
			SET @startingParent = (
				SELECT parent_dept_id FROM mc_org_departments
				WHERE id = @startingOrgDept )
		END
	END


	CREATE TABLE #orgStructure (
		id					INT				
		, name				nvarchar(255)	
		, parent_dept_id	INT				
		, org_level			INT ) ;
		
	WITH orgTree (id, name, parentID, level) AS (
		SELECT 
			id , name as name, parent_dept_id, @startingLevel
		FROM mc_org_departments as topLevel
		WHERE topLevel.ID = @startingOrgDept 
		UNION ALL 
		SELECT 
			child.id, child.name, child.parent_dept_id, @startingLevel + 1
		FROM mc_org_departments AS child
		INNER JOIN orgTree AS parent
			ON child.parent_dept_id = parent.id )
			
	INSERT INTO #orgStructure
	SELECT * FROM orgTree
	
	WHILE (@startingParent > 0)
	BEGIN
		
		INSERT INTO #orgStructure (	id ) 
		SELECT @startingParent;
		
		SET @startingParent = (
			SELECT parent_dept_id from mc_org_departments
			WHERE id = @startingParent )
	
	END
		
	UPDATE #orgStructure SET 
		name = A.name 
		, parent_dept_id = A.parent_dept_id
		, org_level = A.org_level
	FROM mc_org_departments as A 
	WHERE #orgStructure.id = A.id 
		AND #orgStructure.parent_dept_id IS NULL; 
			
	IF @numberLevels <> 0 
	BEGIN
		DELETE FROM #orgStructure
		WHERE org_level < ( @startingLevel - @numberLevels ) OR
			org_level > ( @startingLevel + @numberLevels ) ;
	END
	
	SELECT * FROM #orgStructure
	ORDER BY org_level ;

END

