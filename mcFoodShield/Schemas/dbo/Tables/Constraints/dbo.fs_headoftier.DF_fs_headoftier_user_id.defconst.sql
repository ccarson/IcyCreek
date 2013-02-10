ALTER TABLE [dbo].[fs_headoftier]
    ADD CONSTRAINT [DF_fs_headoftier_user_id] DEFAULT ('0') FOR [user_id];

