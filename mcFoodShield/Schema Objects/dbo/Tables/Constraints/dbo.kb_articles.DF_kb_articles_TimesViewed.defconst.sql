ALTER TABLE [dbo].[kb_articles]
    ADD CONSTRAINT [DF_kb_articles_TimesViewed] DEFAULT ('0') FOR [TimesViewed];

