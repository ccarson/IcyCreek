ALTER TABLE [dbo].[mc_groups_features]
    ADD CONSTRAINT [DF_mc_groups_features_active] DEFAULT ((0)) FOR [active];

