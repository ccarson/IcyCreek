ALTER TABLE [dbo].[content_mc_addresstypes]
    ADD CONSTRAINT [DF_content_mc_addresstypes_typename] DEFAULT (N'') FOR [typename];

