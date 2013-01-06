CREATE PROCEDURE [dbo].[convertContactNotes] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50) 
	, @dbname AS NVARCHAR(50) 
	, @tableName AS NVARCHAR (50) )	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql AS NVARCHAR(4000);
	
	INSERT INTO dbo.ContactNotes ( 
		id, contactsID, notes
		, adminID, dateAdded, type_id )
	SELECT tn.id, tc.id, notes
		, tc2.id, dateAdded, type_id
	FROM dbo.mc_contact_notesSYN AS n
	INNER JOIN dbo.tempLegacyIDs AS tn ON n.id = tn.legacyID
	INNER JOIN dbo.vw_transitionContacts AS tc ON tc.contactsID = n.user_id
		AND tc.transitionSystemsID = @systemID
	LEFT JOIN dbo.vw_transitionContacts AS tc2 ON tc2.contactsID = n.admin_id
		AND tc.transitionSystemsID = @systemID
	ORDER BY n.user_id
	
	INSERT INTO dbo.transitionIdentities
	SELECT * FROM dbo.tempLegacyIDs;
	
	SET @sql = N'DROP TABLE ' + @dbname + '.dbo.mc_contact_notes' ;
	EXECUTE sp_executesql @sql;

	SET @sql = N'
		USE [' + @dbname + '] ; 
		EXEC ( ''
		CREATE VIEW dbo.mc_contact_notes AS
			SELECT tn.ContactNotesID AS id, tc1.contactsID AS user_id, n.notes
				, COALESCE( tc2.contactsID, 0 ) AS admin_id, n.dateAdded, n.type_id
			FROM dbo.ContactNotes AS n
			INNER JOIN dbo.vw_transitionContactNotes AS tn ON n.id = tn.id 
				AND tn.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			INNER JOIN dbo.vw_transitionContacts AS tc1 ON n.ContactsID = tc1.id 
				AND tc1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			LEFT JOIN dbo.vw_transitionContacts AS tc2	ON n.adminID = tc2.id 
				AND tc2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) '' ) ';

				
	EXECUTE sp_executesql @sql;

END
