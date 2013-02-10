ALTER TABLE [dbo].[fs_agencydir_adminlog]
    ADD CONSTRAINT [DF_fs_agencydir_adminlog_agency_id] DEFAULT ('0') FOR [agency_id];

