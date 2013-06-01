ALTER TABLE [dbo].[mc_groups_listusers]
    ADD CONSTRAINT [DF_mc_groups_listusers_igroup_id] DEFAULT ('0') FOR [igroup_id];

