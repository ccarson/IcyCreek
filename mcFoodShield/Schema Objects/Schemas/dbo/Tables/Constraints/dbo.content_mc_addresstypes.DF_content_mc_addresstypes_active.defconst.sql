ALTER TABLE [dbo].[content_mc_addresstypes]
    ADD CONSTRAINT [DF_content_mc_addresstypes_active] DEFAULT ((0)) FOR [active];

