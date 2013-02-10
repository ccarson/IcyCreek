ALTER TABLE [dbo].[mc_contact_payments]
    ADD CONSTRAINT [DF_mc_contact_payments_changedate] DEFAULT (NULL) FOR [changedate];

