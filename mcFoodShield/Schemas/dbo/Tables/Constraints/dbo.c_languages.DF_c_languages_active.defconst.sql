ALTER TABLE [dbo].[c_languages]
    ADD CONSTRAINT [DF_c_languages_active] DEFAULT ((0)) FOR [active];

