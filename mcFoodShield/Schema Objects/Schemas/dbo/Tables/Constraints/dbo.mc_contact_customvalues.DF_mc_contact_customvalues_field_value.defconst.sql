ALTER TABLE [dbo].[mc_contact_customvalues]
    ADD CONSTRAINT [DF_mc_contact_customvalues_field_value] DEFAULT (N'') FOR [field_value];

