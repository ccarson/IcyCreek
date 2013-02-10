ALTER TABLE [dbo].[content_mc_org_location]
    ADD CONSTRAINT [DF_content_mc_org_location_d_emergency_phone] DEFAULT (NULL) FOR [d_emergency_phone];

