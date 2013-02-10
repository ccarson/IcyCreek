ALTER TABLE [dbo].[content_mc_organization]
    ADD CONSTRAINT [DF_content_mc_organization_type_id] DEFAULT ('0') FOR [type_id];

