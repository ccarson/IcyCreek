ALTER TABLE [dbo].[fs_allhazardtitles]
    ADD CONSTRAINT [DF_fs_allhazardtitles_hazardTitle] DEFAULT (N'') FOR [hazardTitle];

