ALTER TABLE [dbo].[h_articles]
    ADD CONSTRAINT [DF_h_articles_bactive] DEFAULT ((1)) FOR [bactive];

