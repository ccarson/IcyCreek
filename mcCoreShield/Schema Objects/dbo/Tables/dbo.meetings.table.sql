CREATE TABLE [dbo].[meetings] (
    [id]                   INT            IDENTITY (249, 1) NOT NULL,
    [sMeetingName]         NVARCHAR (255) NOT NULL,
    [iConnectID]           INT            DEFAULT ((0)) NOT NULL,
    [dStartDateTime]       DATETIME2 (0)  NOT NULL,
    [dEndDateTime]         DATETIME2 (0)  NOT NULL,
    [iTimeZoneID]          INT            DEFAULT ((0)) NOT NULL,
    [bRecurring]           BIT            DEFAULT ((0)) NOT NULL,
    [bInvites]             BIT            NOT NULL,
    [iCreatedBy]           INT            DEFAULT ((0)) NOT NULL,
    [dCreated]             DATETIME2 (0)  NOT NULL,
    [bPriority]            BIT            DEFAULT ((0)) NOT NULL,
    [bActive]              BIT            DEFAULT ((1)) NOT NULL,
    [iSchedulerID]         INT            DEFAULT ((0)) NOT NULL,
    [iAgendaID]            INT            DEFAULT ((0)) NOT NULL,
    [iMeetingType]         INT            DEFAULT ((0)) NOT NULL,
    [bInConnect]           BIT            DEFAULT ((0)) NOT NULL,
    [sSummary]             NVARCHAR (MAX) NULL,
    [sAudioBridge]         NVARCHAR (30)  NULL,
    [sPasscode]            NVARCHAR (30)  NULL,
    [sBridgeInstructions]  NVARCHAR (MAX) NULL,
    [sMeetingURL]          NVARCHAR (255) NULL,
    [groupID]              INT            DEFAULT ((0)) NOT NULL,
    [meetingAccess]        NVARCHAR (15)  DEFAULT (N'public') NOT NULL,
    [systemID]             INT            DEFAULT ((0)) NOT NULL,
    [meetingLengthMinutes] AS             (datediff(minute,[dStartDateTime],[dEndDateTime])),
    CONSTRAINT [PK_meetings_id] PRIMARY KEY CLUSTERED ([id] ASC)
);




GO
CREATE NONCLUSTERED INDEX [ixMeetings_StartTime]
    ON [dbo].[meetings]([dStartDateTime] ASC)
    INCLUDE([id], [sMeetingName], [dEndDateTime], [iCreatedBy], [systemID]);

