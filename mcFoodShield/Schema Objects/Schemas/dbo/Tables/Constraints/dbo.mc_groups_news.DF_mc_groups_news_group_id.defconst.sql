ALTER TABLE [dbo].[mc_groups_news]
    ADD CONSTRAINT [DF_mc_groups_news_group_id] DEFAULT ('0') FOR [group_id];

