CREATE TABLE [dbo].[photos_events] (
    [eid]                INT            IDENTITY (1955, 1) NOT NULL,
    [event_name]         NVARCHAR (255) NULL,
    [event_date]         DATETIME2 (0)  NULL,
    [event_summary]      NVARCHAR (MAX) NULL,
    [event_created_date] DATETIME2 (0)  NULL,
    [event_created_by]   INT            NULL,
    [upsize_ts]          DATETIME       NULL,
    [group_id]           INT            NOT NULL,
    [makepublic]         BIT            NOT NULL,
    [org_id]             INT            NOT NULL,
    [folder_location]    NVARCHAR (255) NULL,
    [thumb_location]     NVARCHAR (255) NULL,
    [relative_path]      NVARCHAR (255) NULL,
    [foldertype]         INT            NOT NULL,
    [makeevent]          BIT            NOT NULL,
    [user_id]            INT            NOT NULL,
    [bactive]            BIT            NOT NULL,
    [parent_event]       INT            NOT NULL
);

