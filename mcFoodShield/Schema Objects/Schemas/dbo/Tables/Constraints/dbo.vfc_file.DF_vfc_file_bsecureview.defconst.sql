ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_bsecureview] DEFAULT ((0)) FOR [bsecureview];

