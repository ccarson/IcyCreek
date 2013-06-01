ALTER TABLE [dbo].[pt_screenshots]
    ADD CONSTRAINT [DF_pt_screenshots_title] DEFAULT (NULL) FOR [title];

