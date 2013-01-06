ALTER TABLE [dbo].[fs_headoftier]
    ADD CONSTRAINT [DF_fs_headoftier_added_by] DEFAULT ('0') FOR [added_by];

