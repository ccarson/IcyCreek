ALTER TABLE [dbo].[photos_pictures]
    ADD CONSTRAINT [DF_photos_pictures_event_id] DEFAULT ('0') FOR [event_id];

