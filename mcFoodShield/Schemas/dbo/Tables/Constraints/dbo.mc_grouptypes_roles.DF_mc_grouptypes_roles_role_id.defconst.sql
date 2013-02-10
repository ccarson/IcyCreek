ALTER TABLE [dbo].[mc_grouptypes_roles]
    ADD CONSTRAINT [DF_mc_grouptypes_roles_role_id] DEFAULT ('0') FOR [role_id];

