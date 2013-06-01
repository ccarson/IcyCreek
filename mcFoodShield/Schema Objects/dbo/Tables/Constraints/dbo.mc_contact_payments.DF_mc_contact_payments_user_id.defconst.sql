ALTER TABLE [dbo].[mc_contact_payments]
    ADD CONSTRAINT [DF_mc_contact_payments_user_id] DEFAULT ('0') FOR [user_id];

