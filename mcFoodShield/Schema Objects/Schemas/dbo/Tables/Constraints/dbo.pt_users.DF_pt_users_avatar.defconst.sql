ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_avatar] DEFAULT (NULL) FOR [avatar];

