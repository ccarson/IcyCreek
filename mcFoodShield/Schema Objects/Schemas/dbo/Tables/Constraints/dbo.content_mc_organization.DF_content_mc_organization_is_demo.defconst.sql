ALTER TABLE [dbo].[content_mc_organization]
    ADD CONSTRAINT [DF_content_mc_organization_is_demo] DEFAULT ((0)) FOR [is_demo];

