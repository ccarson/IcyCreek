CREATE TABLE [dbo].[vid_videos] (
    [vid_VideoID]   INT            IDENTITY (7, 1) NOT NULL,
    [vid_VideoType] NVARCHAR (10)  NULL,
    [vid_VideoName] NVARCHAR (50)  NULL,
    [vid_VideoFile] NVARCHAR (MAX) NULL,
    [vid_VideoDesc] NVARCHAR (MAX) NULL,
    [vid_Height]    INT            NULL,
    [vid_Width]     INT            NULL,
    [vid_group_id]  INT            NOT NULL
);

