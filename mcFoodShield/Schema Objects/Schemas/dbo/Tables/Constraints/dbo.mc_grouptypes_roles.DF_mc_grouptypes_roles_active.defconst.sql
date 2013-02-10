ALTER TABLE [dbo].[mc_grouptypes_roles]
    ADD CONSTRAINT [DF_mc_grouptypes_roles_active] DEFAULT ((0)) FOR [active];

