ALTER TABLE [dbo].[mc_groups_peers]
    ADD CONSTRAINT [DF_mc_groups_peers_user_id] DEFAULT ('0') FOR [user_id];

