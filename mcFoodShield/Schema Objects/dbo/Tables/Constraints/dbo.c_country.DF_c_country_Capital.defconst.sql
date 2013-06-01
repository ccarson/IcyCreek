ALTER TABLE [dbo].[c_country]
    ADD CONSTRAINT [DF_c_country_Capital] DEFAULT (NULL) FOR [Capital];

