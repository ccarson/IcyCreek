ALTER TABLE [dbo].[c_country]
    ADD CONSTRAINT [DF_c_country_NationalitySingular] DEFAULT (NULL) FOR [NationalitySingular];

