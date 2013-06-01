CREATE TABLE [dbo].[galleon_users] (
    [id]           NVARCHAR (35)   NOT NULL,
    [username]     NVARCHAR (50)   NOT NULL,
    [password]     NVARCHAR (50)   NOT NULL,
    [emailaddress] NVARCHAR (255)  NOT NULL,
    [signature]    NVARCHAR (1000) NOT NULL,
    [datecreated]  DATETIME        NOT NULL,
    [confirmed]    BIT             NOT NULL,
    [avatar]       NVARCHAR (255)  NULL
);

