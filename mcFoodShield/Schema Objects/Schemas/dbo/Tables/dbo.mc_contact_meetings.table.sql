CREATE TABLE [dbo].[mc_contact_meetings] (
    [id]                INT              IDENTITY (1407, 1) NOT NULL,
    [iMeetingID]        INT              NOT NULL,
    [iConnectMeetingID] INT              NOT NULL,
    [iUserID]           INT              NOT NULL,
    [iRoleID]           INT              NOT NULL,
    [iResponse]         INT              NOT NULL,
    [linkID]            UNIQUEIDENTIFIER NULL,
    [linkAccessDate]    DATETIME         NULL,
    [linkAccessCount]   INT              NULL,
    [responseDate]      DATETIME         NULL
);

