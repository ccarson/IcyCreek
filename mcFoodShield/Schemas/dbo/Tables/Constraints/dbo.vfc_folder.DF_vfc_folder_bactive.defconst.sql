ALTER TABLE [dbo].[vfc_folder]
    ADD CONSTRAINT [DF_vfc_folder_bactive] DEFAULT ((1)) FOR [bactive];

