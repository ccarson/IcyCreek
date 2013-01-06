ALTER TABLE [dbo].[security_roles_template]
    ADD CONSTRAINT [DF_security_roles_template_role_id] DEFAULT ('0') FOR [role_id];

