ALTER TABLE [dbo].[mc_groups_lists]
    ADD CONSTRAINT [DF_mc_groups_lists_bactive] DEFAULT ((1)) FOR [bactive];

