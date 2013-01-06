ALTER TABLE [dbo].[mc_news]
    ADD CONSTRAINT [DF_mc_news_headline] DEFAULT (N'') FOR [headline];

