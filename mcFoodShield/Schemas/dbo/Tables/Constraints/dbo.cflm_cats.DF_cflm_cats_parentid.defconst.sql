ALTER TABLE [dbo].[cflm_cats]
    ADD CONSTRAINT [DF_cflm_cats_parentid] DEFAULT ('0') FOR [parentid];

