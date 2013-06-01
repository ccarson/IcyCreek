ALTER TABLE [dbo].[c_country]
    ADD CONSTRAINT [DF_c_country_CurrencyCode] DEFAULT (NULL) FOR [CurrencyCode];

