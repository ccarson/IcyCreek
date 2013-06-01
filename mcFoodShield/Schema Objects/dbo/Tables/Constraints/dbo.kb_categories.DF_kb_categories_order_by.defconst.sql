ALTER TABLE [dbo].[kb_categories]
    ADD CONSTRAINT [DF_kb_categories_order_by] DEFAULT ('0') FOR [order_by];

