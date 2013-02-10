ALTER TABLE [dbo].[vfc_file_logs]
    ADD CONSTRAINT [DF_vfc_file_logs_iMinorrevision] DEFAULT ('0') FOR [iMinorrevision];

