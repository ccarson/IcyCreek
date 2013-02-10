CREATE TABLE [dbo].[calendarEventRights] (
    [id]              INT              IDENTITY (1, 1) NOT NULL,
    [calenderEventID] UNIQUEIDENTIFIER NOT NULL,
    [userID]          INT              NOT NULL,
    [canEdit]         BIT              NOT NULL
);

