ALTER TABLE [dbo].[cflm_cats]
    ADD CONSTRAINT [DF_cflm_cats_category_name] DEFAULT (N'') FOR [category_name];

