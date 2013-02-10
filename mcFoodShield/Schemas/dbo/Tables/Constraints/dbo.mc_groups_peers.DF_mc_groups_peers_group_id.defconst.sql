ALTER TABLE [dbo].[mc_groups_peers]
    ADD CONSTRAINT [DF_mc_groups_peers_group_id] DEFAULT ('0') FOR [group_id];

