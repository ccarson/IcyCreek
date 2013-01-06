CREATE VIEW [dbo].[vw_transitionContactSMEProfiles] AS 
	SELECT id
		, transitionSystemsID
		, legacyID AS ContactSMEProfilesID
	FROM dbo.transitionIdentities AS ti
	WHERE EXISTS (
		SELECT * 
		FROM dbo.coreConvertedTables 
		WHERE id = ti.convertedTableID AND 
			tableName = 'mc_contact_sme_profiles' )
