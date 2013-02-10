ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_foldertype] DEFAULT ('0') FOR [foldertype];

