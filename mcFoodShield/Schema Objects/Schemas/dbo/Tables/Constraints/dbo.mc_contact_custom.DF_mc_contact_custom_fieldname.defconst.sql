﻿ALTER TABLE [dbo].[mc_contact_custom]
    ADD CONSTRAINT [DF_mc_contact_custom_fieldname] DEFAULT (N'') FOR [fieldname];

