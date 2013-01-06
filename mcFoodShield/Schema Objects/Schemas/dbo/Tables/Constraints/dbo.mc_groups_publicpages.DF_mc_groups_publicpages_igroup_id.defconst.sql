ALTER TABLE [dbo].[mc_groups_publicpages]
    ADD CONSTRAINT [DF_mc_groups_publicpages_igroup_id] DEFAULT ('0') FOR [igroup_id];

