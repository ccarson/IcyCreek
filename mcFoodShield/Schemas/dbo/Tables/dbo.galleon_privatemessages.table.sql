CREATE TABLE [dbo].[galleon_privatemessages] (
    [id]           NVARCHAR (35)  NOT NULL,
    [fromuseridfk] NVARCHAR (35)  NOT NULL,
    [touseridfk]   NVARCHAR (35)  NOT NULL,
    [sent]         DATETIME       NULL,
    [body]         NTEXT          NOT NULL,
    [subject]      NVARCHAR (255) NOT NULL,
    [unread]       TINYINT        NOT NULL
);

