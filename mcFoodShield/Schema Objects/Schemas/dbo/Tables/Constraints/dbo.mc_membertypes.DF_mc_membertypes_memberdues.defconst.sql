ALTER TABLE [dbo].[mc_membertypes]
    ADD CONSTRAINT [DF_mc_membertypes_memberdues] DEFAULT ('0') FOR [memberdues];

