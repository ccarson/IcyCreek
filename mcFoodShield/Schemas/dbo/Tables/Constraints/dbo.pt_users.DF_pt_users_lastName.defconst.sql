ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_lastName] DEFAULT (NULL) FOR [lastName];

