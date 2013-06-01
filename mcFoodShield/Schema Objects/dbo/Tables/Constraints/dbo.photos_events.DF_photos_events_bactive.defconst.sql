ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_bactive] DEFAULT ((1)) FOR [bactive];

