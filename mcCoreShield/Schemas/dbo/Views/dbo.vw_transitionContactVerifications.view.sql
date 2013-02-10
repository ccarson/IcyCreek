CREATE VIEW [dbo].[vw_transitionContactVerifications] AS 
	SELECT id
		, transitionSystemsID
		, legacyID AS ContactVerificationsID
	FROM dbo.transitionIdentities AS ti
	WHERE EXISTS (
		SELECT * 
		FROM dbo.coreConvertedTables 
		WHERE id = ti.convertedTableID AND 
			tableName = 'mc_contact_verification' )
