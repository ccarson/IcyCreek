ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_ParentFolderID] DEFAULT ('0') FOR [ParentFolderID];

