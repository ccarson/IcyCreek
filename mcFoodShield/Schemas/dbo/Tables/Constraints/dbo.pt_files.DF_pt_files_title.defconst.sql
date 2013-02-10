ALTER TABLE [dbo].[pt_files]
    ADD CONSTRAINT [DF_pt_files_title] DEFAULT (NULL) FOR [title];

