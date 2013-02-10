ALTER TABLE [dbo].[vfc_file_keywords]
    ADD CONSTRAINT [DF_vfc_file_keywords_includeKeyword] DEFAULT ((1)) FOR [includeKeyword];

