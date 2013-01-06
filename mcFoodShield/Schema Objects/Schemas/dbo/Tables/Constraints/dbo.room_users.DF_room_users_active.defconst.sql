ALTER TABLE [dbo].[room_users]
    ADD CONSTRAINT [DF_room_users_active] DEFAULT ('0') FOR [active];

