ALTER TABLE [dbo].[mc_news]
    ADD CONSTRAINT [DF_mc_news_active] DEFAULT ((1)) FOR [active];

