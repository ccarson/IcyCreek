ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_parent_group_id] DEFAULT ('0') FOR [parent_group_id];

