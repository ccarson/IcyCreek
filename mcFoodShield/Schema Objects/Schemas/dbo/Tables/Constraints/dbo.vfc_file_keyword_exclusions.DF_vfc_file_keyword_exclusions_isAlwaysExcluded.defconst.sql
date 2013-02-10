ALTER TABLE [dbo].[vfc_file_keyword_exclusions]
    ADD CONSTRAINT [DF_vfc_file_keyword_exclusions_isAlwaysExcluded] DEFAULT ((1)) FOR [isAlwaysExcluded];

