CREATE TABLE [dbo].[cal_event] (
    [EventID]         INT             IDENTITY (603, 1) NOT NULL,
    [TaskID]          INT             NULL,
    [EventParentID]   INT             NULL,
    [EventCatID]      INT             NULL,
    [EventName]       NVARCHAR (40)   NULL,
    [EventDescr]      NVARCHAR (MAX)  NULL,
    [EventDate]       DATETIME2 (0)   NULL,
    [EventDateEnd]    DATETIME2 (0)   NULL,
    [EventAddDate]    DATETIME2 (0)   NULL,
    [EventNoTime]     BIT             NOT NULL,
    [EventUpdateDate] DATETIME2 (0)   NULL,
    [EventPrivate]    BIT             NOT NULL,
    [Inactive]        BIT             NOT NULL,
    [AddedBy]         INT             NULL,
    [EventRepeat]     BIT             NOT NULL,
    [EventRType]      INT             NULL,
    [EventYearly]     BIT             NOT NULL,
    [GroupIds]        NVARCHAR (MAX)  NULL,
    [upsize_ts]       VARBINARY (MAX) NULL,
    [cal_id]          INT             NOT NULL
);

