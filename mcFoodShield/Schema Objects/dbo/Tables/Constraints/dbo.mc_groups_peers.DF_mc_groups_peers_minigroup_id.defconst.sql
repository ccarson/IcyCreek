ALTER TABLE [dbo].[mc_groups_peers]
    ADD CONSTRAINT [DF_mc_groups_peers_minigroup_id] DEFAULT ('0') FOR [minigroup_id];

