ALTER TABLE [dbo].[c_country]
    ADD CONSTRAINT [DF_c_country_ISO3] DEFAULT (NULL) FOR [ISO3];

