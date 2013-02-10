ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_relative_path] DEFAULT (NULL) FOR [relative_path];

