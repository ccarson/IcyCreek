ALTER TABLE [dbo].[fs_agencydir_adminlog]
    ADD CONSTRAINT [DF_fs_agencydir_adminlog_structure_update_date] DEFAULT (NULL) FOR [structure_update_date];

