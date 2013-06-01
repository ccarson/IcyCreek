ALTER TABLE [dbo].[vfc_mimetype]
    ADD CONSTRAINT [DF_vfc_mimetype_bAllowConvert] DEFAULT ((1)) FOR [bAllowConvert];

