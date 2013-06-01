ALTER TABLE [dbo].[pt_users]
    ADD CONSTRAINT [DF_pt_users_mobile] DEFAULT (NULL) FOR [mobile];

