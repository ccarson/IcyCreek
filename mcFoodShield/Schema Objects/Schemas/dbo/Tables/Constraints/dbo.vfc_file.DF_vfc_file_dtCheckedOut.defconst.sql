ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_dtCheckedOut] DEFAULT (NULL) FOR [dtCheckedOut];

