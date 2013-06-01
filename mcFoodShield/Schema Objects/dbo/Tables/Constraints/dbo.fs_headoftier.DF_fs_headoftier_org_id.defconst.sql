ALTER TABLE [dbo].[fs_headoftier]
    ADD CONSTRAINT [DF_fs_headoftier_org_id] DEFAULT ('0') FOR [org_id];

