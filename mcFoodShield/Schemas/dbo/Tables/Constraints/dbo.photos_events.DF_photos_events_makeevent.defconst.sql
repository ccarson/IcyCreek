ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_makeevent] DEFAULT ((0)) FOR [makeevent];

