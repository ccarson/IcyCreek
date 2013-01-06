ALTER TABLE [dbo].[mc_groups_tags]
    ADD CONSTRAINT [DF_mc_groups_tags_igroup_id] DEFAULT ('0') FOR [igroup_id];

