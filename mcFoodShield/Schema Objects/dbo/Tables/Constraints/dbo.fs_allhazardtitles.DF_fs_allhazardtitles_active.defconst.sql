ALTER TABLE [dbo].[fs_allhazardtitles]
    ADD CONSTRAINT [DF_fs_allhazardtitles_active] DEFAULT ((0)) FOR [active];

