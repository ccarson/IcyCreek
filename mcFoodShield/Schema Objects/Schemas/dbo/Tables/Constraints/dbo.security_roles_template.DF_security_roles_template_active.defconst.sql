ALTER TABLE [dbo].[security_roles_template]
    ADD CONSTRAINT [DF_security_roles_template_active] DEFAULT ((0)) FOR [active];

