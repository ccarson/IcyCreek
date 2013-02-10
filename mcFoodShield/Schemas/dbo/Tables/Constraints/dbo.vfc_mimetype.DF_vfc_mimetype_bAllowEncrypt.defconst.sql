ALTER TABLE [dbo].[vfc_mimetype]
    ADD CONSTRAINT [DF_vfc_mimetype_bAllowEncrypt] DEFAULT ((0)) FOR [bAllowEncrypt];

