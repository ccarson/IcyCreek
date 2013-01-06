ALTER TABLE [dbo].[vid_videos]
    ADD CONSTRAINT [DF_vid_videos_vid_group_id] DEFAULT ('0') FOR [vid_group_id];

