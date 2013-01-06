ALTER TABLE [dbo].[security_groups]
    ADD CONSTRAINT [DF_security_groups_group_name] DEFAULT (N'') FOR [group_name];

