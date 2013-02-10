ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_merged_group_id] DEFAULT ('0') FOR [merged_group_id];

