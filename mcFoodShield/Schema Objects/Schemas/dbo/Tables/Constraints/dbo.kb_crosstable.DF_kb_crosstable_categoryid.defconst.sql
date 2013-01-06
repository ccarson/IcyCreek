ALTER TABLE [dbo].[kb_crosstable]
    ADD CONSTRAINT [DF_kb_crosstable_categoryid] DEFAULT ('0') FOR [categoryid];

