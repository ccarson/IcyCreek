ALTER TABLE [dbo].[c_country]
    ADD CONSTRAINT [DF_c_country_NationalityPlural] DEFAULT (NULL) FOR [NationalityPlural];

