ALTER TABLE [dbo].[photos_pictures]
    ADD CONSTRAINT [DF_photos_pictures_group_id] DEFAULT ('0') FOR [group_id];

