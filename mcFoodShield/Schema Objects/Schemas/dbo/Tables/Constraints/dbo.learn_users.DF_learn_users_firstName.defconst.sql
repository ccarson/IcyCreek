ALTER TABLE [dbo].[learn_users]
    ADD CONSTRAINT [DF_learn_users_firstName] DEFAULT (N'') FOR [firstName];

