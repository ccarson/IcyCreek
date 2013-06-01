CREATE TABLE [dbo].[kb_articles] (
    [ArticleID]      FLOAT          NOT NULL,
    [ArticleSubject] NVARCHAR (75)  NULL,
    [DateCreated]    DATETIME2 (0)  NULL,
    [DateModified]   DATETIME2 (0)  NULL,
    [TimesViewed]    FLOAT          NULL,
    [ArticleBody]    NVARCHAR (MAX) NULL,
    [iLocationType]  INT            NOT NULL,
    [iCreatedBy]     INT            NOT NULL
);

