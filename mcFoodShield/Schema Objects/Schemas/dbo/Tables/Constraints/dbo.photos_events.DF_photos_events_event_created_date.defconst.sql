ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_event_created_date] DEFAULT (NULL) FOR [event_created_date];

