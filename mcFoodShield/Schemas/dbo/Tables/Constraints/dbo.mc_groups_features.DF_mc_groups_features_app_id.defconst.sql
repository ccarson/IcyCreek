ALTER TABLE [dbo].[mc_groups_features]
    ADD CONSTRAINT [DF_mc_groups_features_app_id] DEFAULT ('0') FOR [app_id];

