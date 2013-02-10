CREATE TABLE [dbo].[galleon_conferences] (
    [id]               NVARCHAR (35)  NOT NULL,
    [name]             NVARCHAR (255) NOT NULL,
    [description]      NVARCHAR (255) NOT NULL,
    [active]           BIT            NOT NULL,
    [messages]         INT            NULL,
    [lastpost]         VARCHAR (35)   NULL,
    [lastpostuseridfk] VARCHAR (35)   NULL,
    [lastpostcreated]  DATETIME       NULL
);

