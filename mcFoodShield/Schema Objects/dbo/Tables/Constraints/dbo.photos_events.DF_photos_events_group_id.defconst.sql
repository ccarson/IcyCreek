ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_group_id] DEFAULT ('0') FOR [group_id];

