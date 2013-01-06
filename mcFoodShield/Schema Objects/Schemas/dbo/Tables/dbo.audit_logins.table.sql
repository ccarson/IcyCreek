CREATE TABLE [dbo].[audit_logins] (
    [id]         INT            IDENTITY (27551, 1) NOT NULL,
    [sLogin]     NVARCHAR (100) NOT NULL,
    [sPassword]  NVARCHAR (50)  NOT NULL,
    [dLogged]    DATETIME2 (0)  NOT NULL,
    [sIPAddress] NVARCHAR (20)  NOT NULL
);

