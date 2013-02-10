ALTER TABLE [dbo].[kb_crosstable]
    ADD CONSTRAINT [DF_kb_crosstable_articleid] DEFAULT ('0') FOR [articleid];

