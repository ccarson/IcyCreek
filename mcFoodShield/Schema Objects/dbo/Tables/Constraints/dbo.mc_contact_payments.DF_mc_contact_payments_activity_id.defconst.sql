ALTER TABLE [dbo].[mc_contact_payments]
    ADD CONSTRAINT [DF_mc_contact_payments_activity_id] DEFAULT ('0') FOR [activity_id];

