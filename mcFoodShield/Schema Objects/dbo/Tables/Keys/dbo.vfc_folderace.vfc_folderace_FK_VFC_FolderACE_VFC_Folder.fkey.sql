ALTER TABLE [dbo].[vfc_folderace]
    ADD CONSTRAINT [vfc_folderace$FK_VFC_FolderACE_VFC_Folder] FOREIGN KEY ([FolderID]) REFERENCES [dbo].[vfc_folder] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

