ALTER TABLE [dbo].[mc_payment_items]
    ADD CONSTRAINT [DF_mc_payment_items_itemname] DEFAULT (N'') FOR [itemname];

