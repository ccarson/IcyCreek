ALTER TABLE [dbo].[pt_files]
    ADD CONSTRAINT [DF_pt_files_serverfilename] DEFAULT (NULL) FOR [serverfilename];

