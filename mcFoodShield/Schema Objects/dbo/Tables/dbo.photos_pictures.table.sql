CREATE TABLE [dbo].[photos_pictures] (
    [picture_id]      INT            IDENTITY (3, 1) NOT NULL,
    [provider_id]     INT            NULL,
    [picture_name]    NVARCHAR (255) NULL,
    [picture_caption] NVARCHAR (MAX) NULL,
    [picture_date]    DATETIME2 (0)  NULL,
    [event_id]        INT            NULL,
    [date_uploaded]   DATETIME2 (0)  NULL,
    [file_name]       NVARCHAR (255) NULL,
    [upsize_ts]       DATETIME       NULL,
    [group_id]        INT            NOT NULL,
    [bactive]         BIT            NOT NULL,
    [thumb_name]      NVARCHAR (255) NULL,
    [preview_name]    NVARCHAR (255) NULL
);

