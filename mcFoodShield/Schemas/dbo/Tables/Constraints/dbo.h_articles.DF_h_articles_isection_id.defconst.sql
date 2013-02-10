ALTER TABLE [dbo].[h_articles]
    ADD CONSTRAINT [DF_h_articles_isection_id] DEFAULT ('0') FOR [isection_id];

