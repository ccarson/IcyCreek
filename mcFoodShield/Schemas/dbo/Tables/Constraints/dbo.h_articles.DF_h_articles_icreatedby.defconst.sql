ALTER TABLE [dbo].[h_articles]
    ADD CONSTRAINT [DF_h_articles_icreatedby] DEFAULT ('0') FOR [icreatedby];

