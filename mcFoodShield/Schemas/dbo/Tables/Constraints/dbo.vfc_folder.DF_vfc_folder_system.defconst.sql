ALTER TABLE [dbo].[vfc_folder]
    ADD CONSTRAINT [DF_vfc_folder_system] DEFAULT ((0)) FOR [system];

