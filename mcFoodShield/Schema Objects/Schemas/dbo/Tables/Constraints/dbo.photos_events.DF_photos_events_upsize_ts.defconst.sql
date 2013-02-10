ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_upsize_ts] DEFAULT (NULL) FOR [upsize_ts];

