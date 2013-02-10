CREATE TABLE [dbo].[fuseguard_users] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [username] VARCHAR (50)  NOT NULL,
    [password] VARCHAR (128) NOT NULL,
    [token]    VARCHAR (128) NOT NULL,
    [email]    VARCHAR (128) NULL,
    [enabled]  INT           NOT NULL,
    [roles]    VARCHAR (128) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);

