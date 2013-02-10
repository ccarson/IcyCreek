CREATE TABLE [dbo].[calendarEvents] (
    [id]           UNIQUEIDENTIFIER NOT NULL,
    [title]        NVARCHAR (400)   NOT NULL,
    [body]         NVARCHAR (1000)  NULL,
    [startTime]    DATETIME2 (7)    NOT NULL,
    [endTime]      DATETIME2 (7)    NOT NULL,
    [categoryID]   INT              NOT NULL,
    [sourceID]     NVARCHAR (50)    NULL,
    [isGlobal]     BIT              NOT NULL,
    [groupID]      INT              NULL,
    [AddedBy]      INT              NOT NULL,
    [DateAdded]    DATETIME         NOT NULL,
    [iCalFileName] NVARCHAR (50)    NULL
);

