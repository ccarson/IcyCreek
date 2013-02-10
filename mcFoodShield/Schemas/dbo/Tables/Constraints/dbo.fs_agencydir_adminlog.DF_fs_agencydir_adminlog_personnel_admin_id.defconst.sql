ALTER TABLE [dbo].[fs_agencydir_adminlog]
    ADD CONSTRAINT [DF_fs_agencydir_adminlog_personnel_admin_id] DEFAULT ('0') FOR [personnel_admin_id];

