CREATE TABLE [dbo].[galleon_messages] (
    [id]         NVARCHAR (35)  NOT NULL,
    [title]      NVARCHAR (255) NOT NULL,
    [body]       NTEXT          NOT NULL,
    [posted]     DATETIME       NOT NULL,
    [useridfk]   NVARCHAR (35)  NOT NULL,
    [threadidfk] NVARCHAR (35)  NOT NULL,
    [attachment] NVARCHAR (255) NOT NULL,
    [filename]   NVARCHAR (255) NOT NULL
);

