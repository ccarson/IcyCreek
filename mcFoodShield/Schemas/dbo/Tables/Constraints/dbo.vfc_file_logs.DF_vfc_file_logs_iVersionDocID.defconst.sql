ALTER TABLE [dbo].[vfc_file_logs]
    ADD CONSTRAINT [DF_vfc_file_logs_iVersionDocID] DEFAULT ('0') FOR [iVersionDocID];

