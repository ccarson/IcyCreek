ALTER TABLE [dbo].[fs_agencydir_adminlog]
    ADD CONSTRAINT [DF_fs_agencydir_adminlog_structure_admin_id] DEFAULT ('0') FOR [structure_admin_id];

