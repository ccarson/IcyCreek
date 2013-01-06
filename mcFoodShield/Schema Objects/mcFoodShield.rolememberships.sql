EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'gmathews';


GO
EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'gmathews';


GO
EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'dneuman';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'dneuman';


GO
EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'dneuman';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'gricks';


GO
EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'gricks';

