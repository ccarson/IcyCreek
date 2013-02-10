ALTER TABLE [dbo].[chat_rooms]
    ADD CONSTRAINT [DF_chat_rooms_allow_private] DEFAULT ('0') FOR [allow_private];

