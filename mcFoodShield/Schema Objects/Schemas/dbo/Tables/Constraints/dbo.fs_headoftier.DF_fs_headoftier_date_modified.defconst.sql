ALTER TABLE [dbo].[fs_headoftier]
    ADD CONSTRAINT [DF_fs_headoftier_date_modified] DEFAULT (NULL) FOR [date_modified];

