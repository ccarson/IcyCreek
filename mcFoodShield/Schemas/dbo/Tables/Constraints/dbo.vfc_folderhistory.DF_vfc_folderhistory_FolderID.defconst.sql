ALTER TABLE [dbo].[vfc_folderhistory]
    ADD CONSTRAINT [DF_vfc_folderhistory_FolderID] DEFAULT ('0') FOR [FolderID];

