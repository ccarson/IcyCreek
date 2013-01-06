ALTER TABLE [dbo].[photos_pictures]
    ADD CONSTRAINT [DF_photos_pictures_preview_name] DEFAULT (NULL) FOR [preview_name];

