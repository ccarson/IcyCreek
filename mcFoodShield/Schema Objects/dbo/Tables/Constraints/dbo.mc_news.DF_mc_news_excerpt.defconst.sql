ALTER TABLE [dbo].[mc_news]
    ADD CONSTRAINT [DF_mc_news_excerpt] DEFAULT (N'') FOR [excerpt];

