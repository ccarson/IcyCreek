ALTER TABLE [dbo].[kb_articles]
    ADD CONSTRAINT [DF_kb_articles_iLocationType] DEFAULT ('0') FOR [iLocationType];

