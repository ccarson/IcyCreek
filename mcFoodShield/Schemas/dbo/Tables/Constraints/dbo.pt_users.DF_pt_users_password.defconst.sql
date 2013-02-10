ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_password] DEFAULT (NULL) FOR [password];

