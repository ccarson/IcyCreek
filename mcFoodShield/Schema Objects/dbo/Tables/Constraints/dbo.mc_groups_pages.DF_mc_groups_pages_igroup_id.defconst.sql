ALTER TABLE [dbo].[mc_groups_pages]
    ADD CONSTRAINT [DF_mc_groups_pages_igroup_id] DEFAULT ('0') FOR [igroup_id];

