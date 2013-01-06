CREATE TABLE [dbo].[audit_logins_all] (
    [portal]  NVARCHAR (20)  NULL,
    [sLogin]  NVARCHAR (100) NOT NULL,
    [dLogged] DATETIME2 (0)  NOT NULL
);

