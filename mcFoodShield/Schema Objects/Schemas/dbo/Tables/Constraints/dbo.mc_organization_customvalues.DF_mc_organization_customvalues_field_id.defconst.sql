ALTER TABLE [dbo].[mc_organization_customvalues]
    ADD CONSTRAINT [DF_mc_organization_customvalues_field_id] DEFAULT ('0') FOR [field_id];

