ALTER TABLE [dbo].[fs_headoftier]
    ADD CONSTRAINT [DF_fs_headoftier_modified_by] DEFAULT ('0') FOR [modified_by];

