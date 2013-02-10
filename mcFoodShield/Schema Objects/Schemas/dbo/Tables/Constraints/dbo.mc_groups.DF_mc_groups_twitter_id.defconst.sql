ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_twitter_id] DEFAULT (NULL) FOR [twitter_id];

