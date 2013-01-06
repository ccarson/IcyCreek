-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteSystem] (
	@systemID AS INT )
AS
BEGIN
	SET NOCOUNT ON;

	DELETE dbo.transitionIdentities
	FROM dbo.transitionIdentities AS i
	WHERE i.transitionSystemsID = @systemID ;

	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from transitionIdentities'; 
	
	DELETE dbo.ContactAddresses
	FROM dbo.ContactAddresses AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from ContactAddresses '; 
	
	DELETE dbo.ContactEmails
	FROM dbo.ContactEmails AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from ContactEmails '; 
	
	DELETE dbo.ContactNotes
	FROM dbo.ContactNotes AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from ContactNotes '; 

	
	DELETE dbo.ContactOrganizations
	FROM dbo.ContactOrganizations AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from ContactOrganizations '; 

	
	DELETE dbo.ContactOrgRoles
	FROM dbo.ContactOrgRoles AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from ContactOrgRoles '; 

	
	DELETE dbo.ContactPhones
	FROM dbo.ContactPhones AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from ContactPhones '; 

	
	DELETE dbo.ContactVerifications
	FROM dbo.ContactVerifications AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from ContactVerifications '; 

	
	DELETE dbo.Contacts
	FROM dbo.Contacts AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from Contacts '; 

	
	DELETE dbo.OrgDepartmentLab
	FROM dbo.OrgDepartmentLab AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from OrgDepartmentLab ' ; 	

	DELETE dbo.OrgDepartments
	FROM dbo.OrgDepartments AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from OrgDepartments ' ; 

	DELETE dbo.OrgLocations
	FROM dbo.OrgLocations AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from OrgLocations ' ; 

	DELETE dbo.Organizations
	FROM dbo.Organizations AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from Organizations ' ; 

	DELETE dbo.RolesRoleCategories
	FROM dbo.RolesRoleCategories AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from RolesRoleCategories ' ; 

	DELETE dbo.RoleCategories
	FROM dbo.RoleCategories AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from RoleCategories ' ; 

	DELETE dbo.Roles
	FROM dbo.Roles AS a
	WHERE NOT EXISTS (
		SELECT * FROM dbo.transitionIdentities AS i
		WHERE i.id = a.id ); 
		
	PRINT CAST(@@ROWCOUNT AS nvarchar(20)) + N' rows deleted from Roles ' ; 



END

