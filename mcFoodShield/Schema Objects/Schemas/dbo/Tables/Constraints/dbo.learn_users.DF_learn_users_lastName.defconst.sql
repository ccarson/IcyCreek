ALTER TABLE [dbo].[learn_users]
    ADD CONSTRAINT [DF_learn_users_lastName] DEFAULT (N'') FOR [lastName];

