ALTER TABLE [dbo].[fs_agencydir_adminlog]
    ADD CONSTRAINT [DF_fs_agencydir_adminlog_personnel_update_date] DEFAULT (NULL) FOR [personnel_update_date];

