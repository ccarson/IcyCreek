ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_email] DEFAULT (NULL) FOR [email];

