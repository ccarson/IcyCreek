ALTER TABLE [dbo].[mc_addresstypes]
    ADD CONSTRAINT [DF_mc_addresstypes_active] DEFAULT ((0)) FOR [active];

