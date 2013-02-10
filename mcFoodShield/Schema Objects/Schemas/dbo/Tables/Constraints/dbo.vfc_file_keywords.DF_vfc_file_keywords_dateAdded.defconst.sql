ALTER TABLE [dbo].[vfc_file_keywords]
    ADD CONSTRAINT [DF_vfc_file_keywords_dateAdded] DEFAULT (sysdatetime()) FOR [dateAdded];

