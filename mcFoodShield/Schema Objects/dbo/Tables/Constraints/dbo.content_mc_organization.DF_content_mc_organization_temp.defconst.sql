ALTER TABLE [dbo].[content_mc_organization]
    ADD CONSTRAINT [DF_content_mc_organization_temp] DEFAULT ((0)) FOR [temp];

