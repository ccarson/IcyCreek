ALTER TABLE [dbo].[mc_groups_features_options]
    ADD CONSTRAINT [DF_mc_groups_features_options_isActive] DEFAULT ((0)) FOR [isActive];

