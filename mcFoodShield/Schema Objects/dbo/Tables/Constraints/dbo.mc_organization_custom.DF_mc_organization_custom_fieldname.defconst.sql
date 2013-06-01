ALTER TABLE [dbo].[mc_organization_custom]
    ADD CONSTRAINT [DF_mc_organization_custom_fieldname] DEFAULT (N'') FOR [fieldname];

