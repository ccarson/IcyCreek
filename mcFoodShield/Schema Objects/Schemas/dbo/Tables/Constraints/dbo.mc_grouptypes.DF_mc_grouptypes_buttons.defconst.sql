ALTER TABLE [dbo].[mc_grouptypes]
    ADD CONSTRAINT [DF_mc_grouptypes_buttons] DEFAULT ((1)) FOR [buttons];

