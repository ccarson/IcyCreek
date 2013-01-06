CREATE TABLE [dbo].[galleon_forums] (
    [id]               NVARCHAR (35)  NOT NULL,
    [name]             NVARCHAR (255) NOT NULL,
    [description]      NVARCHAR (255) NOT NULL,
    [active]           BIT            NOT NULL,
    [attachments]      BIT            NOT NULL,
    [conferenceidfk]   NVARCHAR (35)  NOT NULL,
    [messages]         INT            NULL,
    [lastpost]         VARCHAR (35)   NULL,
    [lastpostuseridfk] VARCHAR (35)   NULL,
    [lastpostcreated]  DATETIME       NULL,
    [createdByID]      INT            NULL
);

