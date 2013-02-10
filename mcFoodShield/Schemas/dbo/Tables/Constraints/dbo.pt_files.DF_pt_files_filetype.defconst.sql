ALTER TABLE [dbo].[pt_files]
    ADD CONSTRAINT [DF_pt_files_filetype] DEFAULT (NULL) FOR [filetype];

