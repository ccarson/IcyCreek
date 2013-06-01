ALTER TABLE [dbo].[mc_contact_payments]
    ADD CONSTRAINT [DF_mc_contact_payments_type_id] DEFAULT ('0') FOR [type_id];

