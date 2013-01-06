ALTER TABLE [dbo].[c_country]
    ADD CONSTRAINT [DF_c_country_MapReference] DEFAULT (NULL) FOR [MapReference];

