﻿ALTER TABLE [dbo].[content_mc_organization]
    ADD CONSTRAINT [DF_content_mc_organization_updated_by] DEFAULT ('0') FOR [updated_by];

