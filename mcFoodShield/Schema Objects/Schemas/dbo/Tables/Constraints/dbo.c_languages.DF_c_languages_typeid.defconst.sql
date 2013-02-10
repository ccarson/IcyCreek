ALTER TABLE [dbo].[c_languages]
    ADD CONSTRAINT [DF_c_languages_typeid] DEFAULT ('0') FOR [typeid];

