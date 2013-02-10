ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_event_name] DEFAULT (N'') FOR [event_name];

