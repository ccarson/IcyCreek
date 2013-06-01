ALTER TABLE [dbo].[kb_files]
    ADD CONSTRAINT [DF_kb_files_FilePath] DEFAULT (N'') FOR [FilePath];

