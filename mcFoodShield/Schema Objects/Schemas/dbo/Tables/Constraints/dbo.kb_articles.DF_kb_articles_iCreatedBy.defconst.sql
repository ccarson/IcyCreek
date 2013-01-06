ALTER TABLE [dbo].[kb_articles]
    ADD CONSTRAINT [DF_kb_articles_iCreatedBy] DEFAULT ('0') FOR [iCreatedBy];

