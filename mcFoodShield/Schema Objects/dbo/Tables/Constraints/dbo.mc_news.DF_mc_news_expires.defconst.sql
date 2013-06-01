ALTER TABLE [dbo].[mc_news]
    ADD CONSTRAINT [DF_mc_news_expires] DEFAULT (NULL) FOR [expires];

