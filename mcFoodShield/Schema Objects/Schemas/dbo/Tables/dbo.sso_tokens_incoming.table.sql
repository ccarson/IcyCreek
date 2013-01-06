CREATE TABLE [dbo].[sso_tokens_incoming] (
    [id]            INT            IDENTITY (1, 1) NOT NULL,
    [user_id]       INT            NOT NULL,
    [user_token]    NVARCHAR (250) NULL,
    [token_expires] DATETIME       NULL,
    [email]         NVARCHAR (100) NULL
);

