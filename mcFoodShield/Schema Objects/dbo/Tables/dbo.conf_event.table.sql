CREATE TABLE [dbo].[conf_event] (
    [id]                   INT             IDENTITY (3, 1) NOT NULL,
    [event_name]           NVARCHAR (255)  NOT NULL,
    [description]          NVARCHAR (MAX)  NULL,
    [start_date]           DATETIME2 (0)   NULL,
    [end_date]             DATETIME2 (0)   NULL,
    [reg_start_date]       DATETIME2 (0)   NULL,
    [reg_end_date]         DATETIME2 (0)   NULL,
    [venue_info]           NVARCHAR (MAX)  NULL,
    [lodging_info]         NVARCHAR (MAX)  NULL,
    [notification_subject] NVARCHAR (1000) NULL,
    [notification_email]   NVARCHAR (MAX)  NULL,
    [group_id]             INT             NOT NULL,
    [active]               BIT             NOT NULL,
    [created_by]           INT             NOT NULL,
    [created_date]         DATETIME2 (0)   NULL,
    [updated_by]           INT             NOT NULL,
    [updated_date]         DATETIME2 (0)   NULL
);

