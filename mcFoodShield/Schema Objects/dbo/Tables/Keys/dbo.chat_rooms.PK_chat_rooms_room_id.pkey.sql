﻿ALTER TABLE [dbo].[chat_rooms]
    ADD CONSTRAINT [PK_chat_rooms_room_id] PRIMARY KEY CLUSTERED ([room_id] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

