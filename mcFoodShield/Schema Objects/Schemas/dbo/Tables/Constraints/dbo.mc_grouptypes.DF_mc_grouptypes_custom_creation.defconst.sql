ALTER TABLE [dbo].[mc_grouptypes]
    ADD CONSTRAINT [DF_mc_grouptypes_custom_creation] DEFAULT ((0)) FOR [custom_creation];

