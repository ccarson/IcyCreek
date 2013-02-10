ALTER TABLE [dbo].[learn_users]
    ADD CONSTRAINT [DF_learn_users_username] DEFAULT (N'') FOR [username];

