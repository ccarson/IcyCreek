ALTER TABLE [dbo].[mc_contact_customvalues]
    ADD CONSTRAINT [DF_mc_contact_customvalues_field_id] DEFAULT ('0') FOR [field_id];

