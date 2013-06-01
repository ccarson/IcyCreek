ALTER TABLE [dbo].[security_groups]
    ADD CONSTRAINT [DF_security_groups_description] DEFAULT (N'') FOR [description];

