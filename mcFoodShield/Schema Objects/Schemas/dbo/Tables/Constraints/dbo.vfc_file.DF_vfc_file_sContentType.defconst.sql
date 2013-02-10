ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_sContentType] DEFAULT (N'application/octet-stream') FOR [sContentType];

