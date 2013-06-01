ALTER TABLE [dbo].[chat_rooms]
    ADD CONSTRAINT [DF_chat_rooms_permanent] DEFAULT ('0') FOR [permanent];

