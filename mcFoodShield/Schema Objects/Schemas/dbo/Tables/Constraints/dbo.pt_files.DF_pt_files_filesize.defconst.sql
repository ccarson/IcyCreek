ALTER TABLE [dbo].[pt_files]
    ADD CONSTRAINT [DF_pt_files_filesize] DEFAULT (NULL) FOR [filesize];

