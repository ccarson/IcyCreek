ALTER TABLE [dbo].[kb_articles]
    ADD CONSTRAINT [DF_kb_articles_DateCreated] DEFAULT (NULL) FOR [DateCreated];

