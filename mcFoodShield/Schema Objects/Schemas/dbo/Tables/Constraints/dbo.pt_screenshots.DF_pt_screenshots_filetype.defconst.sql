ALTER TABLE [dbo].[pt_screenshots]
    ADD CONSTRAINT [DF_pt_screenshots_filetype] DEFAULT (NULL) FOR [filetype];

