ALTER TABLE [dbo].[photos_pictures]
    ADD CONSTRAINT [DF_photos_pictures_upsize_ts] DEFAULT (NULL) FOR [upsize_ts];

