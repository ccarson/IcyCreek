EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'dscxnCF';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'dscxnCF';

