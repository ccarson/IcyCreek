ALTER TABLE [dbo].[photos_pictures]
    ADD CONSTRAINT [DF_photos_pictures_file_name] DEFAULT (N'') FOR [file_name];

