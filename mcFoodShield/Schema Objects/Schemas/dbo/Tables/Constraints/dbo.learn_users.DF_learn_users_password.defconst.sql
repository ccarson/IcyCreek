ALTER TABLE [dbo].[learn_users]
    ADD CONSTRAINT [DF_learn_users_password] DEFAULT (N'') FOR [password];

