ALTER TABLE [dbo].[mc_groups_customvalues]
    ADD CONSTRAINT [DF_mc_groups_customvalues_group_id] DEFAULT ('0') FOR [group_id];

