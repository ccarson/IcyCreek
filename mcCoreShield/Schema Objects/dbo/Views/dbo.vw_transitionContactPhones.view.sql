CREATE VIEW [dbo].[vw_transitionContactPhones] AS 
	SELECT id
		, transitionSystemsID
		, legacyID AS ContactPhonesID
	FROM dbo.transitionIdentities AS ti
	WHERE EXISTS (
		SELECT * 
		FROM dbo.coreConvertedTables 
		WHERE id = ti.convertedTableID AND 
			tableName = 'mc_contact_phones' )
