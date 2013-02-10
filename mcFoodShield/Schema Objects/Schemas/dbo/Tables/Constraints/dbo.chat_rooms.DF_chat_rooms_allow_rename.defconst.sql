ALTER TABLE [dbo].[chat_rooms]
    ADD CONSTRAINT [DF_chat_rooms_allow_rename] DEFAULT ('0') FOR [allow_rename];

