ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_fileUUID] DEFAULT (newsequentialid()) FOR [uid];

