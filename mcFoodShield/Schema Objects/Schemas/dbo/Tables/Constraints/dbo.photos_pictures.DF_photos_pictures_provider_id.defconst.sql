ALTER TABLE [dbo].[photos_pictures]
    ADD CONSTRAINT [DF_photos_pictures_provider_id] DEFAULT ('0') FOR [provider_id];

