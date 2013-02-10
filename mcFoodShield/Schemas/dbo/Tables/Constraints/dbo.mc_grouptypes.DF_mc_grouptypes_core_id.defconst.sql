ALTER TABLE [dbo].[mc_grouptypes]
    ADD CONSTRAINT [DF_mc_grouptypes_core_id] DEFAULT ('0') FOR [core_id];

