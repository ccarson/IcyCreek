﻿ALTER TABLE [dbo].[fs_contact_labids]
    ADD CONSTRAINT [DF_fs_contact_labids_labid] DEFAULT ('0') FOR [labid];

