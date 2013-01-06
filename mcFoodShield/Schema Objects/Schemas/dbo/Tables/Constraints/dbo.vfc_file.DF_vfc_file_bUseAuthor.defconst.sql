ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_bUseAuthor] DEFAULT ((0)) FOR [bUseAuthor];

