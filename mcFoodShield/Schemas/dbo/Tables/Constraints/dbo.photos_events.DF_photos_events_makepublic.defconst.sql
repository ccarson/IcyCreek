ALTER TABLE [dbo].[photos_events]
    ADD CONSTRAINT [DF_photos_events_makepublic] DEFAULT ((0)) FOR [makepublic];

