ALTER TABLE [dbo].[mc_groups_peergroup]
    ADD CONSTRAINT [DF_mc_groups_peergroup_bactive] DEFAULT ((1)) FOR [bactive];

