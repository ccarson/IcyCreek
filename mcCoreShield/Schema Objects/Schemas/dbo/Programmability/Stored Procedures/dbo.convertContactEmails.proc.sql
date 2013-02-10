﻿CREATE PROCEDURE [dbo].[convertContactEmails] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50)
	, @dbname AS NVARCHAR(50)
	, @tableName AS NVARCHAR (50) )
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql AS NVARCHAR(4000);

	INSERT INTO dbo.ContactEmails (
		id, contactsID, email
		, type_id, edefault, active
		, epublic, alert, is_emergency )
	SELECT t.id, tc.id, e.email
		, e.type_id, e.edefault, e.active
		, e.epublic, e.alert, e.is_emergency
	FROM dbo.mc_contact_emailsSYN AS e
	INNER JOIN dbo.tempLegacyIDs AS t ON t.legacyID = e.id
	INNER JOIN dbo.vw_transitionContacts AS tc ON tc.contactsID = e.user_id 
		AND tc.transitionSystemsID = @systemID
	ORDER BY e.user_id;

	INSERT INTO dbo.transitionIdentities
	SELECT * FROM dbo.tempLegacyIDs;

/*	create view for contactEmails on legacy database */
	SET @sql = N'DROP TABLE ' + @dbname + '.dbo.mc_contact_emails' ;
	EXECUTE sp_executesql @sql;

	SET @sql = N'
		USE ' + QUOTENAME(@dbname, '[]') + N';
		EXEC ( ''
			CREATE VIEW dbo.mc_contact_emails AS
			SELECT te.ContactEmailsID AS id, e.email, tc.contactsID AS user_id
				, e.type_id, e.edefault, e.active
				, e.epublic, e.alert, e.is_emergency
			FROM dbo.ContactEmails AS e
			INNER JOIN dbo.vw_transitionContactEmails AS te	ON e.id = te.id
				AND te.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			INNER JOIN dbo.vw_transitionContacts AS tc ON e.contactsID = tc.id
				AND tc.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) '' ) ';

	EXECUTE sp_executesql @sql;

END