﻿ALTER TABLE [dbo].[vfc_file]
    ADD CONSTRAINT [DF_vfc_file_thumbs] DEFAULT ((0)) FOR [thumbs];

