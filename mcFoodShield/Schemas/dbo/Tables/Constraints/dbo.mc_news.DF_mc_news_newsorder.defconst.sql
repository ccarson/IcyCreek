ALTER TABLE [dbo].[mc_news]
    ADD CONSTRAINT [DF_mc_news_newsorder] DEFAULT ('0') FOR [newsorder];

