ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_username] DEFAULT (NULL) FOR [username];

