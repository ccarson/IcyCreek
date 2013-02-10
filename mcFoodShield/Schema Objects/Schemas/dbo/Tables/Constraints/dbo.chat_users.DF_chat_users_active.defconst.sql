ALTER TABLE [dbo].[chat_users]
    ADD CONSTRAINT [DF_chat_users_active] DEFAULT ('1') FOR [active];

