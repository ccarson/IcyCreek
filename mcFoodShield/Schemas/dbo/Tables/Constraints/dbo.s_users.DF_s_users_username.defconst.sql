ALTER TABLE [dbo].[s_users]
    ADD CONSTRAINT [DF_s_users_username] DEFAULT (NULL) FOR [username];

