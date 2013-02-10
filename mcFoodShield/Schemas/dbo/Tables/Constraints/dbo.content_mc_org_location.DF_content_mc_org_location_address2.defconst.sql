ALTER TABLE [dbo].[content_mc_org_location]
    ADD CONSTRAINT [DF_content_mc_org_location_address2] DEFAULT (N'') FOR [address2];

