ALTER TABLE [dbo].[vid_videos]
    ADD CONSTRAINT [DF_vid_videos_vid_VideoName] DEFAULT (NULL) FOR [vid_VideoName];

