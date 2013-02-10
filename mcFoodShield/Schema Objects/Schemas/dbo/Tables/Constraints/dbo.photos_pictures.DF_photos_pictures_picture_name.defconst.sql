ALTER TABLE [dbo].[photos_pictures]
    ADD CONSTRAINT [DF_photos_pictures_picture_name] DEFAULT (N'') FOR [picture_name];

