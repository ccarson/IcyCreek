ALTER TABLE [dbo].[security_roles]
    ADD CONSTRAINT [DF_security_roles_group_id] DEFAULT ('0') FOR [group_id];

