﻿CREATE PROCEDURE [dbo].[convertContactAddresses] (
	@systemID AS INT
	, @systemName AS NVARCHAR(50)
	, @dbname AS NVARCHAR(50)
	, @tableName AS NVARCHAR (50) )
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sql AS NVARCHAR(4000);

	INSERT INTO dbo.ContactAddresses (
		id, contactsID, add_type
		, address1, address2, address3
		, city, state, zip
		, country, defaultaddress, name, createdDate )
	SELECT t.id, tc.id AS contactsID, a.add_type
		, a.address1, a.address2, a.address3
		, a.city, a.state, a.zip
		, a.country, a.defaultaddress, a.name, a.createdDate
	FROM dbo.mc_contact_addressesSYN AS a
	INNER JOIN dbo.tempLegacyIDs AS t ON a.id = t.legacyID
	INNER JOIN dbo.vw_transitionContacts AS tc ON a.user_id = tc.ContactsID 
		AND tc.transitionSystemsID = @systemID
	ORDER BY a.user_id;

	INSERT INTO dbo.transitionIdentities
	SELECT * FROM dbo.tempLegacyIDs;


/*	create view for contactAddresses on legacy database */
	SET @sql = N'DROP TABLE ' + @dbname + '.dbo.mc_contact_addresses' ;
	EXECUTE sp_executesql @sql;

	SET @sql = N'
		USE ' + QUOTENAME(@dbname, '[]') + N';
		EXEC ( ''
			CREATE VIEW dbo.mc_contact_addresses AS 
			SELECT t.ContactAddressesID AS id, a.add_type, a.address1
				, a.address2, a.address3, a.city
				, a.state, a.zip, a.country
				, tc.contactsID AS user_id, a.defaultaddress, a.name, a.createdDate
			FROM dbo.ContactAddresses AS a
			INNER JOIN dbo.vw_transitionContactAddresses AS t ON a.id = t.id
				AND t.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) 
			INNER JOIN dbo.vw_transitionContacts AS tc ON a.ContactsID = tc.id
				AND tc.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = N''''' + @dbName + N''''' ) '' ) ' ;
	EXECUTE sp_executesql @sql;

END
