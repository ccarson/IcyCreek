ALTER TABLE [dbo].[content_mc_organization]
    ADD CONSTRAINT [DF_content_mc_organization_vertical_id] DEFAULT ('0') FOR [vertical_id];

