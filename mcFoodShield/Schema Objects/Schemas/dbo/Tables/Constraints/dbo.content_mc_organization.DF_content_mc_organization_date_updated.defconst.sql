ALTER TABLE [dbo].[content_mc_organization]
    ADD CONSTRAINT [DF_content_mc_organization_date_updated] DEFAULT (NULL) FOR [date_updated];

