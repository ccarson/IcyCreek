ALTER TABLE [dbo].[security_roles]
    ADD CONSTRAINT [DF_security_roles_role_name] DEFAULT (N'') FOR [role_name];

