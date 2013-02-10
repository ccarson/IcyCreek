ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_thumb_location] DEFAULT (NULL) FOR [thumb_location];

