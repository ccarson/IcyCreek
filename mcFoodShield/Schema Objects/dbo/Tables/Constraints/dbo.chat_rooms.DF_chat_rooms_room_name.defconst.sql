ALTER TABLE [dbo].[chat_rooms]
    ADD CONSTRAINT [DF_chat_rooms_room_name] DEFAULT (N'') FOR [room_name];

