﻿ALTER TABLE [dbo].[photos_pictures]
    ADD CONSTRAINT [PK_photos_pictures_picture_id] PRIMARY KEY CLUSTERED ([picture_id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

