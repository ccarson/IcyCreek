CREATE TABLE [dbo].[tblmeetingitem] (
    [meetingItemId] INT            IDENTITY (63, 1) NOT NULL,
    [meetingId]     INT            NOT NULL,
    [title]         NVARCHAR (200) NOT NULL,
    [description]   NVARCHAR (MAX) NOT NULL,
    [startDate]     DATETIME2 (0)  NOT NULL,
    [endDate]       DATETIME2 (0)  NOT NULL,
    [pollID]        INT            NOT NULL
);

