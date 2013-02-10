ALTER TABLE [dbo].[mc_groups_sharing]
    ADD CONSTRAINT [DF_mc_groups_sharing_igroup_id] DEFAULT ('0') FOR [igroup_id];

