ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_parent_event] DEFAULT ('0') FOR [parent_event];

