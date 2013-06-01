ALTER TABLE [dbo].[security_roles_template]
    ADD CONSTRAINT [DF_security_roles_template_func_id] DEFAULT ('0') FOR [func_id];

