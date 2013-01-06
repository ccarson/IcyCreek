ALTER TABLE [dbo].[pt_files]
    ADD CONSTRAINT [DF_pt_files_uploaded] DEFAULT (NULL) FOR [uploaded];

