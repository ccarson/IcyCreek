ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_active] DEFAULT (NULL) FOR [active];

