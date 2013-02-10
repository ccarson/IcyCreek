ALTER TABLE [dbo].[c_paymenttype]
    ADD CONSTRAINT [DF_c_paymenttype_active] DEFAULT ((0)) FOR [active];

