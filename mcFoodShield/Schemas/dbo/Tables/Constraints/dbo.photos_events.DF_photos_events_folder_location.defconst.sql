ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_folder_location] DEFAULT (NULL) FOR [folder_location];

