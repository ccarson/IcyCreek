ALTER TABLE [dbo].[vid_videos]
    ADD CONSTRAINT [DF_vid_videos_vid_VideoType] DEFAULT (NULL) FOR [vid_VideoType];

