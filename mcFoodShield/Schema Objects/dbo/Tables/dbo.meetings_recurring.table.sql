CREATE TABLE [dbo].[meetings_recurring] (
    [id]             INT           NOT NULL,
    [iMeetingID]     INT           NOT NULL,
    [dStartDateTime] DATETIME2 (0) NOT NULL,
    [dEndDateTime]   DATETIME2 (0) NOT NULL,
    [bActive]        BIT           NOT NULL,
    [iTimeZome]      INT           NOT NULL
);

