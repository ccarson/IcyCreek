﻿ALTER TABLE [dbo].[pt_screenshots]
    ADD CONSTRAINT [DF_pt_screenshots_filename] DEFAULT (NULL) FOR [filename];

