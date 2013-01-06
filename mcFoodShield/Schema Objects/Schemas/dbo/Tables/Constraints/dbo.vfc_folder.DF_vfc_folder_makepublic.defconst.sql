ALTER TABLE [dbo].[vfc_folder]
    ADD CONSTRAINT [DF_vfc_folder_makepublic] DEFAULT ((0)) FOR [makepublic];

