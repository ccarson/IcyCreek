CREATE PROCEDURE [dbo].[convertContactVerifications] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50) 
	, @dbname AS NVARCHAR(50) 
	, @tableName AS NVARCHAR (50) )	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql AS NVARCHAR(4000);
	
	INSERT INTO dbo.ContactVerifications (
		id, contactsID, verified_by, verified_Date )
	SELECT t.id, tc1.id AS contactsID, tc2.id AS verified_by, verified_date
	FROM dbo.mc_contact_verificationSYN AS v
	INNER JOIN dbo.tempLegacyIDs AS t ON t.legacyID = v.id
	INNER JOIN dbo.vw_transitionContacts AS tc1 ON tc1.contactsID = v.user_id	
		AND tc1.transitionSystemsID = @systemID
	LEFT JOIN dbo.vw_transitionContacts AS tc2 ON tc2.contactsID = v.verified_by
		AND tc2.transitionSystemsID = @systemID;
		
	INSERT INTO dbo.transitionIdentities
	SELECT * FROM dbo.tempLegacyIDs;	
		
	SET @sql = N'DROP TABLE ' + @dbname + '.dbo.mc_contact_verification' ; 
	EXECUTE sp_executesql @sql;

	
	SET @sql = N'
		USE [' + @dbname + '] ; 
		EXEC ( ''
		CREATE VIEW dbo.mc_contact_verification AS
			SELECT tv.ContactVerificationsID AS id, tc1.contactsID AS user_id
				, COALESCE( tc2.contactsID, 0 ) AS verified_by
				, v.verified_date
			FROM dbo.ContactVerifications AS v
			INNER JOIN dbo.vw_transitionContactVerifications AS tv ON tv.id = v.id 
				AND tv.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			INNER JOIN dbo.vw_transitionContacts AS tc1 ON tc1.id = v.contactsID
				AND tc1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			LEFT JOIN dbo.vw_transitionContacts AS tc2 ON tc2.id = v.verified_by
				AND	tc2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) '' ) ';

	EXECUTE sp_executesql @sql;

END
