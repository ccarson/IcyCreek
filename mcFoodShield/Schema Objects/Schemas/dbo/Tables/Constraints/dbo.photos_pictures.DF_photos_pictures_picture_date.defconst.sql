ALTER TABLE [dbo].[photos_pictures]
    ADD CONSTRAINT [DF_photos_pictures_picture_date] DEFAULT (NULL) FOR [picture_date];

