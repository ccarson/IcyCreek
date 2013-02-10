CREATE TABLE [dbo].[learn_users] (
    [userID]      NVARCHAR (35)  NOT NULL,
    [username]    NVARCHAR (50)  NOT NULL,
    [firstName]   NVARCHAR (50)  NOT NULL,
    [lastName]    NVARCHAR (50)  NOT NULL,
    [email]       NVARCHAR (250) NOT NULL,
    [password]    NVARCHAR (50)  NOT NULL,
    [createdOn]   DATETIME2 (0)  NULL,
    [lastLoginOn] DATETIME2 (0)  NULL,
    [roleID]      NVARCHAR (50)  NOT NULL,
    [updatedOn]   DATETIME       NOT NULL,
    [IsArchived]  BIT            NOT NULL
);

