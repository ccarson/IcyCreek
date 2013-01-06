ALTER TABLE [dbo].[fs_wkgrp_features]
    ADD CONSTRAINT [DF_fs_wkgrp_features_active] DEFAULT ((0)) FOR [active];

