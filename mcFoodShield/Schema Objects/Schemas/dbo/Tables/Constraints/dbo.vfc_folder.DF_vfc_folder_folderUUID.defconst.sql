ALTER TABLE [dbo].[vfc_folder]
    ADD CONSTRAINT [DF_vfc_folder_folderUUID] DEFAULT (newsequentialid()) FOR [folderUUID];

