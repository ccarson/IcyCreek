ALTER TABLE [dbo].[kb_files]
    ADD CONSTRAINT [DF_kb_files_FileName] DEFAULT (N'') FOR [FileName];

