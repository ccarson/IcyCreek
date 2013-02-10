ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_event_created_by] DEFAULT ('0') FOR [event_created_by];

