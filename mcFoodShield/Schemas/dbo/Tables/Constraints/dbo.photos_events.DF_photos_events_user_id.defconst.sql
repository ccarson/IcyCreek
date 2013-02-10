ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_user_id] DEFAULT ('0') FOR [user_id];

