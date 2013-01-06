ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_admin] DEFAULT (NULL) FOR [admin];

