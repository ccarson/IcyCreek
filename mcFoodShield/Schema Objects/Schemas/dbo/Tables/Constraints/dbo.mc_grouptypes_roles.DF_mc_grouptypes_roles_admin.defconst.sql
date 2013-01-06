ALTER TABLE [dbo].[mc_grouptypes_roles]
    ADD CONSTRAINT [DF_mc_grouptypes_roles_admin] DEFAULT ((0)) FOR [admin];

