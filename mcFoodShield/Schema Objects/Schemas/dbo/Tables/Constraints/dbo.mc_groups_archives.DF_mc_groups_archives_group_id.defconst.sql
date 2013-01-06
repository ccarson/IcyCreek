ALTER TABLE [dbo].[mc_groups_archives]
    ADD CONSTRAINT [DF_mc_groups_archives_group_id] DEFAULT ('0') FOR [group_id];

