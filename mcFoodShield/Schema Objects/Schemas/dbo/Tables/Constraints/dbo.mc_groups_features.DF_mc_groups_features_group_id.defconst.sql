ALTER TABLE [dbo].[mc_groups_features]
    ADD CONSTRAINT [DF_mc_groups_features_group_id] DEFAULT ('0') FOR [group_id];

