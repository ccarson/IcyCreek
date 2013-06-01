ALTER TABLE [dbo].[mc_payment_items]
    ADD CONSTRAINT [DF_mc_payment_items_active] DEFAULT ((0)) FOR [active];

