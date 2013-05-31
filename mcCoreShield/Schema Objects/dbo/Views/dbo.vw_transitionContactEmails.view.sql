CREATE VIEW [dbo].[vw_transitionContactEmails] AS 
	SELECT id
		, transitionSystemsID
		, legacyID AS ContactEmailsID
	FROM dbo.transitionIdentities AS ti
	WHERE EXISTS (
		SELECT * 
		FROM dbo.coreConvertedTables 
		WHERE id = ti.convertedTableID AND 
			tableName = 'mc_contact_emails' )
