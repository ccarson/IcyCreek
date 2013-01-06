CREATE VIEW [dbo].[vw_transitionContactNotes] AS 
	SELECT id
		, transitionSystemsID
		, legacyID AS ContactNotesID
	FROM dbo.transitionIdentities AS ti
	WHERE EXISTS (
		SELECT * 
		FROM dbo.coreConvertedTables 
		WHERE id = ti.convertedTableID AND 
			tableName = 'mc_contact_notes' )
