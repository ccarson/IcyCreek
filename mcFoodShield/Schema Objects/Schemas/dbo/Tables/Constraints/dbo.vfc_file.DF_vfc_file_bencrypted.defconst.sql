ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_bencrypted] DEFAULT ((0)) FOR [bencrypted];

