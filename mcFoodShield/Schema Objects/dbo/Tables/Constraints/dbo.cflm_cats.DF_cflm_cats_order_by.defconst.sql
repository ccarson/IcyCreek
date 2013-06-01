ALTER TABLE [dbo].[cflm_cats]
    ADD CONSTRAINT [DF_cflm_cats_order_by] DEFAULT ('0') FOR [order_by];

