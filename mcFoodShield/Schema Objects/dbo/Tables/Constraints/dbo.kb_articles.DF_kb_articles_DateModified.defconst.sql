ALTER TABLE [dbo].[kb_articles]
    ADD CONSTRAINT [DF_kb_articles_DateModified] DEFAULT (NULL) FOR [DateModified];

