ALTER TABLE [dbo].[mc_groups_features]
    ADD CONSTRAINT [DF_mc_groups_features_expires] DEFAULT (NULL) FOR [expires];

