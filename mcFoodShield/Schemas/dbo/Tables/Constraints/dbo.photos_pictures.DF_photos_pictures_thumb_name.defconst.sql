ALTER TABLE [dbo].[photos_pictures]
    ADD CONSTRAINT [DF_photos_pictures_thumb_name] DEFAULT (NULL) FOR [thumb_name];

