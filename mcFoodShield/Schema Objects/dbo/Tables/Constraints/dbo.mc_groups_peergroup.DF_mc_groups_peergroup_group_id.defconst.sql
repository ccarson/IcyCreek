ALTER TABLE [dbo].[mc_groups_peergroup]
    ADD CONSTRAINT [DF_mc_groups_peergroup_group_id] DEFAULT ('0') FOR [group_id];

