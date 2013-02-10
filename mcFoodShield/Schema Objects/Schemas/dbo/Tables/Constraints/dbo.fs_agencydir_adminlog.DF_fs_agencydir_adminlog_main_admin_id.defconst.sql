ALTER TABLE [dbo].[fs_agencydir_adminlog]
    ADD CONSTRAINT [DF_fs_agencydir_adminlog_main_admin_id] DEFAULT ('0') FOR [main_admin_id];

