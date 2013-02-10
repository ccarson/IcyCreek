ALTER TABLE [dbo].[pt_screenshots]
    ADD CONSTRAINT [DF_pt_screenshots_uploaded] DEFAULT (NULL) FOR [uploaded];

