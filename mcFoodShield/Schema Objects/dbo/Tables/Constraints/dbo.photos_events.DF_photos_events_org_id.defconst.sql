ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_org_id] DEFAULT ('0') FOR [org_id];

