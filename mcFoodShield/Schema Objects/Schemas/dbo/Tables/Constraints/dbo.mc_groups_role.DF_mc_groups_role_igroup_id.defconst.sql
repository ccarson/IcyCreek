ALTER TABLE [dbo].[mc_groups_role]
    ADD CONSTRAINT [DF_mc_groups_role_igroup_id] DEFAULT ('0') FOR [igroup_id];

