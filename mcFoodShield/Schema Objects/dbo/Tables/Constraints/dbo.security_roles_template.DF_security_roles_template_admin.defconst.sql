ALTER TABLE [dbo].[security_roles_template]
    ADD CONSTRAINT [DF_security_roles_template_admin] DEFAULT ('0') FOR [admin];

