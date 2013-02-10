ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_rss] DEFAULT ((0)) FOR [rss];

