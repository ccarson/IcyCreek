ALTER TABLE [dbo].[cflm_cats]
    ADD CONSTRAINT [DF_cflm_cats_is_active] DEFAULT ((0)) FOR [is_active];

