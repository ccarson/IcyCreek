ALTER TABLE [dbo].[pt_files]
    ADD CONSTRAINT [DF_pt_files_filename] DEFAULT (NULL) FOR [filename];

