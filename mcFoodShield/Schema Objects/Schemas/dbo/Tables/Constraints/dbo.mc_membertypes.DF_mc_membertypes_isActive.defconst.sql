ALTER TABLE [dbo].[mc_membertypes]
    ADD CONSTRAINT [DF_mc_membertypes_isActive] DEFAULT ((1)) FOR [isActive];

