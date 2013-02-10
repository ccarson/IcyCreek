ALTER TABLE [dbo].[fs_headoftier]
    ADD CONSTRAINT [DF_fs_headoftier_dept_id] DEFAULT ('0') FOR [dept_id];

