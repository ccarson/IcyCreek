ALTER TABLE [dbo].[learn_users]
    ADD CONSTRAINT [DF_learn_users_userID] DEFAULT (N'') FOR [userID];

