ALTER TABLE [dbo].[c_paymenttype]
    ADD CONSTRAINT [DF_c_paymenttype_typename] DEFAULT (N'') FOR [typename];

