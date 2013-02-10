ALTER TABLE [dbo].[cflm_cats]
    ADD CONSTRAINT [DF_cflm_cats_group_id] DEFAULT ('0') FOR [group_id];

