ALTER TABLE [dbo].[mc_grouptypes]
    ADD CONSTRAINT [DF_mc_grouptypes_type_name] DEFAULT (N'') FOR [type_name];

