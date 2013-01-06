ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_lastLogin] DEFAULT (NULL) FOR [lastLogin];

