﻿ALTER TABLE [dbo].[mc_groupmembers_customvalues]
    ADD CONSTRAINT [DF_mc_groupmembers_customvalues_field_id] DEFAULT ('0') FOR [field_id];

