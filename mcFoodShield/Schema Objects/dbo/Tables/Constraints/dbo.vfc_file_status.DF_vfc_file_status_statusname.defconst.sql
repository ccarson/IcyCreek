ALTER TABLE [dbo].[vfc_file_status]
    ADD CONSTRAINT [DF_vfc_file_status_statusname] DEFAULT (N'') FOR [statusname];

