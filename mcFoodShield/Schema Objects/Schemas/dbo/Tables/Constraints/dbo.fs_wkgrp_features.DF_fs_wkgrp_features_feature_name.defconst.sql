ALTER TABLE [dbo].[fs_wkgrp_features]
    ADD CONSTRAINT [DF_fs_wkgrp_features_feature_name] DEFAULT (N'') FOR [feature_name];

