ALTER TABLE [dbo].[security_roles]
    ADD CONSTRAINT [DF_security_roles_level_id] DEFAULT ('0') FOR [level_id];

