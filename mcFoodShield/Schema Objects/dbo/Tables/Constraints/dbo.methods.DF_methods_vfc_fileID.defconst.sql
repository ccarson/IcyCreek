ALTER TABLE [dbo].[methods]
    ADD CONSTRAINT [DF_methods_vfc_fileID] DEFAULT ((0)) FOR [vfc_fileID];

