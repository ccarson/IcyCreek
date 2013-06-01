ALTER TABLE [dbo].[kb_categories]
    ADD CONSTRAINT [DF_kb_categories_parentid] DEFAULT ('0') FOR [parentid];

