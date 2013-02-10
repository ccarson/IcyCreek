ALTER TABLE [dbo].[c_language_types]
    ADD CONSTRAINT [DF_c_language_types_language] DEFAULT (N'') FOR [language];

