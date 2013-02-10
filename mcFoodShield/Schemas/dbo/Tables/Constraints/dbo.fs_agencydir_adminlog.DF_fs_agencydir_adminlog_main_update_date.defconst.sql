ALTER TABLE [dbo].[fs_agencydir_adminlog]
    ADD CONSTRAINT [DF_fs_agencydir_adminlog_main_update_date] DEFAULT (NULL) FOR [main_update_date];

