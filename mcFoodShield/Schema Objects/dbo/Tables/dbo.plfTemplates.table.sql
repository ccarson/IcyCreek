CREATE TABLE [dbo].[plfTemplates] (
    [templateId]          INT            IDENTITY (1, 1) NOT NULL,
    [templateType]        NVARCHAR (50)  NULL,
    [templateName]        NVARCHAR (150) NULL,
    [templateFolder]      NVARCHAR (100) NULL,
    [templateDescription] TEXT           NULL,
    [templateHTMLSource]  NVARCHAR (150) NULL,
    [templateTextSource]  NVARCHAR (150) NULL,
    [templateThumbnail]   NVARCHAR (150) NULL,
    [templateAuthor]      NVARCHAR (150) NULL,
    [templateDate]        DATETIME       NULL,
    [templateAuthorEmail] NVARCHAR (100) NULL,
    [templateDateAdded]   DATETIME       NULL,
    CHECK ([templateType]='NOTSET' OR [templateType]='MIXED' OR [templateType]='HTML' OR [templateType]='TEXT')
);

