ALTER TABLE [dbo].[kb_articles]
    ADD CONSTRAINT [DF_kb_articles_ArticleSubject] DEFAULT (N'') FOR [ArticleSubject];

