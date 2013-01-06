ALTER TABLE [dbo].[learn_users]
    ADD CONSTRAINT [DF_learn_users_createdOn] DEFAULT (NULL) FOR [createdOn];

