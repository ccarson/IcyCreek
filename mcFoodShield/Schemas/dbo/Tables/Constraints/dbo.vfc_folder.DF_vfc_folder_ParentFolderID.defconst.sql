ALTER TABLE [dbo].[vfc_folder]
    ADD CONSTRAINT [DF_vfc_folder_ParentFolderID] DEFAULT ('0') FOR [ParentFolderID];

