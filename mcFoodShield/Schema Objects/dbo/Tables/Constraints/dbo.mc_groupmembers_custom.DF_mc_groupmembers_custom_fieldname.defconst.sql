﻿ALTER TABLE [dbo].[mc_groupmembers_custom]
    ADD CONSTRAINT [DF_mc_groupmembers_custom_fieldname] DEFAULT (N'') FOR [fieldname];

