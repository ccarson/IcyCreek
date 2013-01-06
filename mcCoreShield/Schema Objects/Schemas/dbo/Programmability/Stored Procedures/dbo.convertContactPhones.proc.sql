CREATE PROCEDURE [dbo].[convertContactPhones] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50) 
	, @dbname AS NVARCHAR(50) 
	, @tableName AS NVARCHAR (50) )	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql AS NVARCHAR(4000);
	
	INSERT INTO dbo.ContactPhones (
		id, contactsID, phone
		, type_id, edefault, active
		, epublic, extension, alert, is_emergency )
	SELECT t.id, tc.id, p.phone
		, p.type_id, p.edefault, p.active
		, p.epublic, p.extension, p.alert, p.is_emergency
	FROM dbo.mc_contact_phonesSYN AS p
	INNER JOIN dbo.tempLegacyIDs AS t ON t.legacyID = p.id
	INNER JOIN dbo.vw_transitionContacts AS tc ON tc.contactsID = p.user_id 
		AND tc.transitionSystemsID = @systemID
	ORDER BY p.user_id;
	
	INSERT INTO dbo.transitionIdentities
	SELECT * FROM dbo.tempLegacyIDs;
	
	
	SET @sql = N'DROP TABLE ' + @dbname + '.dbo.mc_contact_phones' ;
	EXECUTE sp_executesql @sql;

	SET @sql = N'
		USE [' + @dbname + '] ; 
		EXEC ( ''
			CREATE VIEW dbo.mc_contact_phones AS
			SELECT tp.ContactPhonesID AS id, p.phone, tc.contactsID AS user_id
				, p.type_id, p.edefault, p.active
				, p.epublic, p.extension, p.alert, p.is_emergency
			FROM dbo.ContactPhones AS p
			INNER JOIN dbo.vw_transitionContactPhones AS tp	ON tp.id = p.id
				AND	tp.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			INNER JOIN dbo.vw_transitionContacts AS tc ON tc.id = p.ContactsID
				AND	tc.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) '' ) ';
				
	EXECUTE sp_executesql @sql;

END
