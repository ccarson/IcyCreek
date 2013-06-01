ALTER TABLE [dbo].[fs_allhazardtitles]
    ADD CONSTRAINT [DF_fs_allhazardtitles_classification] DEFAULT ('0') FOR [classification];

