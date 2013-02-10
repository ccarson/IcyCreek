ALTER TABLE [dbo].[mc_addresstypes]
    ADD CONSTRAINT [DF_mc_addresstypes_typename] DEFAULT (N'') FOR [typename];

