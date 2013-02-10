ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_dtExpires] DEFAULT (NULL) FOR [dtExpires];

