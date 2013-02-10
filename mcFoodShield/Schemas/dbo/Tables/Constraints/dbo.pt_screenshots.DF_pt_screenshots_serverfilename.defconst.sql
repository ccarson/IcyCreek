ALTER TABLE [dbo].[pt_screenshots]
    ADD CONSTRAINT [DF_pt_screenshots_serverfilename] DEFAULT (NULL) FOR [serverfilename];

