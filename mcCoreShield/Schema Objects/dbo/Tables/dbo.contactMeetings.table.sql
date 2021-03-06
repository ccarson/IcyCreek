﻿CREATE TABLE [dbo].[contactMeetings] (
    [id]                INT              IDENTITY (1407, 1) NOT NULL,
    [iMeetingID]        INT              DEFAULT ('0') NOT NULL,
    [iConnectMeetingID] INT              NOT NULL,
    [iLegacyUserID]     INT              DEFAULT ('0') NOT NULL,
    [iRoleID]           INT              DEFAULT ('0') NOT NULL,
    [iResponse]         INT              DEFAULT ('0') NOT NULL,
    [linkID]            UNIQUEIDENTIFIER NULL,
    [linkAccessDate]    DATETIME         NULL,
    [linkAccessCount]   INT              NULL,
    [responseDate]      DATETIME         NULL,
    [sCoreUserID]       UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_mc_contact_meetings_id] PRIMARY KEY CLUSTERED ([id] ASC)
);




GO
CREATE NONCLUSTERED INDEX [ixContactMeetings_Response]
    ON [dbo].[contactMeetings]([iResponse] ASC, [iMeetingID] ASC);

