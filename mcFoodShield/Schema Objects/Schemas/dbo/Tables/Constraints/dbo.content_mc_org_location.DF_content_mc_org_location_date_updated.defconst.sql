ALTER TABLE [dbo].[content_mc_org_location]
    ADD CONSTRAINT [DF_content_mc_org_location_date_updated] DEFAULT (NULL) FOR [date_updated];

