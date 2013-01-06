ALTER TABLE [dbo].[vfc_file_keywords]
    ADD CONSTRAINT [DF_vfc_file_keywords_excludeKeyword] DEFAULT ((0)) FOR [excludeKeyword];

