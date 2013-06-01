ALTER TABLE [dbo].[content_mc_org_location]
    ADD CONSTRAINT [DF_content_mc_org_location_org_id] DEFAULT ('0') FOR [org_id];

