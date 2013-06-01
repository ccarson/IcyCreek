ALTER TABLE [dbo].[mc_groups_features]
    ADD CONSTRAINT [DF_mc_groups_features_bAllowShare] DEFAULT ((0)) FOR [bAllowShare];

