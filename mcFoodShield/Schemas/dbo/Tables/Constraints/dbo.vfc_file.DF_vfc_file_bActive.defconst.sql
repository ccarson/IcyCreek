ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_bActive] DEFAULT ((0)) FOR [bActive];

