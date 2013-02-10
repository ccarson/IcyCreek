ALTER TABLE [dbo].[content_mc_org_location]
    ADD CONSTRAINT [DF_content_mc_org_location_d_infectious_phone] DEFAULT (NULL) FOR [d_infectious_phone];

