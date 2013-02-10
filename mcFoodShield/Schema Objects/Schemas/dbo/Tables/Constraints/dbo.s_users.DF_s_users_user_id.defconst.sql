ALTER TABLE [dbo].[s_users]
    ADD CONSTRAINT [DF_s_users_user_id] DEFAULT (N'(0)') FOR [user_id];

