ALTER TABLE [dbo].[mc_groups_news]
    ADD CONSTRAINT [DF_mc_groups_news_dtCreated] DEFAULT (getdate()) FOR [dtCreated];

