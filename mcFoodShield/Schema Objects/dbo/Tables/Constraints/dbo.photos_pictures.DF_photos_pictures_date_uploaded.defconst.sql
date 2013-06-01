ALTER TABLE [dbo].[photos_pictures]
    ADD CONSTRAINT [DF_photos_pictures_date_uploaded] DEFAULT (NULL) FOR [date_uploaded];

