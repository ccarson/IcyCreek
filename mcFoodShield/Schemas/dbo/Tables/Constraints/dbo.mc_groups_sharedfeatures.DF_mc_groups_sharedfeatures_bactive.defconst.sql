ALTER TABLE [dbo].[mc_groups_sharedfeatures]
    ADD CONSTRAINT [DF_mc_groups_sharedfeatures_bactive] DEFAULT ((1)) FOR [bactive];

