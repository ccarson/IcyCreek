ALTER TABLE [dbo].[content_mc_org_location]
    ADD CONSTRAINT [DF_content_mc_org_location_date_added] DEFAULT (NULL) FOR [date_added];

