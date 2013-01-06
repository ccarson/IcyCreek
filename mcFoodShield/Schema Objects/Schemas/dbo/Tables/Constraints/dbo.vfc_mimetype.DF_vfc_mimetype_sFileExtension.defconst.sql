ALTER TABLE [dbo].[vfc_mimetype]
    ADD CONSTRAINT [DF_vfc_mimetype_sFileExtension] DEFAULT (N'') FOR [sFileExtension];

