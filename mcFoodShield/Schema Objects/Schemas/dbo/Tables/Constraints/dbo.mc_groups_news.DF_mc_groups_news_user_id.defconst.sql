ALTER TABLE [dbo].[mc_groups_news]
    ADD CONSTRAINT [DF_mc_groups_news_user_id] DEFAULT ('0') FOR [user_id];

