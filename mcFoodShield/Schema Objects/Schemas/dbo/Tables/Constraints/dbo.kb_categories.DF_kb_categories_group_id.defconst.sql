ALTER TABLE [dbo].[kb_categories]
    ADD CONSTRAINT [DF_kb_categories_group_id] DEFAULT ('0') FOR [group_id];

