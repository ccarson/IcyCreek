ALTER TABLE [dbo].[c_country]
    ADD CONSTRAINT [DF_c_country_Currency] DEFAULT (NULL) FOR [Currency];

