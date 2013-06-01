ALTER TABLE [dbo].[security_roles]
    ADD CONSTRAINT [DF_security_roles_active] DEFAULT ((0)) FOR [active];

