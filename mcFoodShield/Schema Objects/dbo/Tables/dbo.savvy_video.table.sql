CREATE TABLE [dbo].[savvy_video] (
    [id]         INT            IDENTITY (5, 1) NOT NULL,
    [iWidth]     INT            NOT NULL,
    [iHeight]    INT            NOT NULL,
    [iPage_ID]   NVARCHAR (255) NOT NULL,
    [iCreatedBy] INT            NOT NULL,
    [dCreatedOn] DATETIME2 (0)  NULL,
    [sVidlink]   NVARCHAR (MAX) NOT NULL
);

