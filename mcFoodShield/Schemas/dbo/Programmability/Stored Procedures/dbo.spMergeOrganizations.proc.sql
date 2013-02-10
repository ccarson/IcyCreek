
-- =============================================
-- Author:		Chris Carson
-- Create date: Agency Merge
-- Description:	Merges source organization into target.
-- Tables affected:
--		mc_organization
--		mc_org_departments
--		mc_org_location
--		mc_organization_customvalues
--		mc_contact_organizations
--		mc_contact_orgroles
--		fs_labdir_orgs
--		fs_foodag_orgs
--		fs_contact_progids
--		fs_contact_labids 
--		fs_contact_agencyids
--	Logic:
--		1) Get name of source organization
--		2) Add department to target organization based on source
--		3) Get newly inserted id from mc_org_departments

-- =============================================
CREATE PROCEDURE [dbo].[spMergeOrganizations] 
	@sourceOrgID AS INT
	, @targetOrgID AS INT
	, @targetParentDepartment AS INT = 0
	, @updatedBy AS INT = 0
AS 
BEGIN

	SET NOCOUNT ON ;

	DECLARE @notes AS NVARCHAR(200) = N'Merged from admin utility' ; 

--	1) Get name of source organization
	DECLARE @name AS NVARCHAR(200);
	SET @name = (
		SELECT o.name FROM dbo.mc_organization AS o
		WHERE o.id = @sourceOrgID ) ;
	
--	2) Add department to target organization based on source
--	   Use targetParentdepartment for parent department, or 0
--	   if source organization is a top-level department
	INSERT INTO dbo.mc_org_departments ( 
		name, org_id
		, location_id, parent_dept_id
		, active, notes
		, website, date_added
		, added_by, date_updated, updated_by ) 
	SELECT 
		@name, @targetOrgID
		, ol.id, @targetParentDepartment
		, 1, @notes
		, website, o.date_added
		, added_by, GETDATE(), @updatedBy  
	FROM dbo.mc_organization AS o
	INNER JOIN dbo.mc_org_location AS ol ON o.id = ol.org_id
	WHERE o.id = @sourceOrgID AND ol.name = 'Default'
	
	IF @@ROWCOUNT = 0
	BEGIN
		RAISERROR ( N'%s does not have a Default location.  The merge failed.', 16, 1, @name ) ;
		RETURN ;
	END 
	
--	3) Get newly inserted id from mc_org_departments
	DECLARE @newDepartmentID AS INT ;
	SET @newDepartmentID = SCOPE_IDENTITY()

	
--	4) Update source org to target org on mc_organization_customvalues
	UPDATE dbo.mc_organization_customvalues SET	org_id = @targetOrgID
	WHERE org_id = @sourceOrgID ;


--	5) Convert mc_org_location in two steps:
--     a) update name of 'Default' location to source org name 
--	   b) update locations from source org_id to target org_id
	UPDATE dbo.mc_org_location SET name = @name 
	WHERE org_id = @sourceOrgID AND name = N'Default' ;

	UPDATE dbo.mc_org_location SET org_id = @targetOrgID
	WHERE org_id = @sourceOrgID ;


--	6) Convert mc_org_departments in two steps:
--	   a) change parent_dept_id from 0 to newly created department_id
--     b) change org_id from source to target
	UPDATE dbo.mc_org_departments SET parent_dept_id = @newDepartmentID
	WHERE org_id = @sourceOrgID AND parent_dept_id = 0 ;

	UPDATE dbo.mc_org_departments SET org_id = @targetOrgID
	WHERE org_id = @sourceOrgID ; 
	

--  7) Convert mc_contact_organizations using same steps from 6) 
	UPDATE dbo.mc_contact_organizations SET org_dept_id = @newDepartmentID
	WHERE org_id = @sourceOrgID AND org_dept_id = 0 ;
	
	UPDATE dbo.mc_contact_organizations SET org_id = @targetOrgID
	WHERE org_id = @sourceOrgID ; 
	
	
--  8) Convert mc_contact_orgroles using same steps from 6) 
	UPDATE dbo.mc_contact_orgroles SET dept_id = @newDepartmentID
	WHERE org_id = @sourceOrgID AND dept_id = 0 ;

	UPDATE dbo.mc_contact_orgroles SET org_id = @targetOrgID
	WHERE org_id = @sourceOrgID ;


--	9) Convert fs_labdir_orgs using same steps from 6) 
	UPDATE dbo.fs_labdir_orgs SET org_dept_id = @newDepartmentID
	WHERE org_id = @sourceOrgID AND org_dept_id = 0 ;
	
	UPDATE dbo.fs_labdir_orgs SET org_id = @targetOrgID
	WHERE org_id = @sourceOrgID ;


--	10) Convert fs_foodag_orgs using same steps from 6) 
	UPDATE dbo.fs_foodag_orgs SET org_dept_id = @newDepartmentID
	WHERE org_id = @sourceOrgID AND org_dept_id = 0 ;

	UPDATE dbo.fs_foodag_orgs SET org_id = @targetOrgID
	WHERE org_id = @sourceOrgID ;


--	11) Convert other fs_ tables by setting source org_id to target org_id
	UPDATE dbo.fs_contact_progids SET agency_id = @targetOrgID
	WHERE agency_id = @sourceOrgID ;

	UPDATE dbo.fs_contact_labids SET agency_id = @targetOrgID
	WHERE agency_id = @sourceOrgID ;

	UPDATE dbo.fs_contact_agencyids SET agencyID = @targetOrgID
	WHERE agencyID = @sourceOrgID ;
	
	
--	12) Delete source organization
	DELETE FROM dbo.mc_organization WHERE id = @sourceOrgID ;

END


	
	

