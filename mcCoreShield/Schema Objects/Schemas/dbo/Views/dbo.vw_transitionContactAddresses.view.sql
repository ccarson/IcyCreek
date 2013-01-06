CREATE VIEW [dbo].[vw_transitionContactAddresses] AS 
	SELECT id
		, transitionSystemsID
		, legacyID AS ContactAddressesID
	FROM dbo.transitionIdentities AS ti
	WHERE EXISTS (
		SELECT * 
		FROM dbo.coreConvertedTables 
		WHERE id = ti.convertedTableID AND 
			tableName = 'mc_contact_addresses' )
