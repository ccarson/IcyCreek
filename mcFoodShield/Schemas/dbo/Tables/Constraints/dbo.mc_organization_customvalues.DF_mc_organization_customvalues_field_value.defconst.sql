ALTER TABLE [dbo].[mc_organization_customvalues]
    ADD CONSTRAINT [DF_mc_organization_customvalues_field_value] DEFAULT (N'') FOR [field_value];

