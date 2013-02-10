ALTER TABLE [dbo].[mc_contact_payments]
    ADD CONSTRAINT [DF_mc_contact_payments_cardnum] DEFAULT ('0') FOR [cardnum];

