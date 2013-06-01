ALTER TABLE [dbo].[photos_pictures]
    ADD CONSTRAINT [DF_photos_pictures_bactive] DEFAULT ((1)) FOR [bactive];

