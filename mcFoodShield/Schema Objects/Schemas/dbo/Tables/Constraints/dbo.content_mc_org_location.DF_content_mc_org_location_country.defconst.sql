﻿ALTER TABLE [dbo].[content_mc_org_location]
    ADD CONSTRAINT [DF_content_mc_org_location_country] DEFAULT (N'US') FOR [country];

