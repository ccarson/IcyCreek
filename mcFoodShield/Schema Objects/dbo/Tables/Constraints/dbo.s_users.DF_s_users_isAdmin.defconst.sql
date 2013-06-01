ALTER TABLE [dbo].[s_users]
    ADD CONSTRAINT [DF_s_users_isAdmin] DEFAULT ((0)) FOR [isAdmin];

