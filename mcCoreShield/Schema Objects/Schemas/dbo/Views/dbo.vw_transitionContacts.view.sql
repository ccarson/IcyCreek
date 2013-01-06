CREATE VIEW [dbo].[vw_transitionContacts] AS 
	SELECT id
		, transitionSystemsID
		, legacyID AS ContactsID
	FROM dbo.transitionIdentities AS ti
	WHERE EXISTS (
		SELECT * 
		FROM dbo.coreConvertedTables 
		WHERE id = ti.convertedTableID AND 
			tableName = 'mc_contact' )
