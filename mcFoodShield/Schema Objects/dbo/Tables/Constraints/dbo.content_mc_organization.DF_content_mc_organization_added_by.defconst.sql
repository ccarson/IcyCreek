ALTER TABLE [dbo].[content_mc_organization]
    ADD CONSTRAINT [DF_content_mc_organization_added_by] DEFAULT ('0') FOR [added_by];

