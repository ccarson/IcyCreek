CREATE TABLE [dbo].[audit_logins_all] (
    [id]      INT            IDENTITY (1, 1) NOT NULL,
    [portal]  NVARCHAR (20)  NULL,
    [sLogin]  NVARCHAR (100) NOT NULL,
    [dLogged] DATETIME2 (0)  NOT NULL,
    CONSTRAINT [PK_audit_logins_all] PRIMARY KEY CLUSTERED ([id] ASC)
);



