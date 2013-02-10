ALTER TABLE [dbo].[c_country]
    ADD CONSTRAINT [DF_c_country_InsertFunction] DEFAULT (NULL) FOR [InsertFunction];

