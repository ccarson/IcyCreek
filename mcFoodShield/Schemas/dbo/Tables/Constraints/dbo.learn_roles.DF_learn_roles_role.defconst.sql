ALTER TABLE [dbo].[learn_roles]
    ADD CONSTRAINT [DF_learn_roles_role] DEFAULT (N'') FOR [role];

