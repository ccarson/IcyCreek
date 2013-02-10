CREATE TABLE [dbo].[event_invites] (
    [eventInviteID] INT          IDENTITY (7, 1) NOT NULL,
    [eventFK]       INT          NULL,
    [userID]        INT          NOT NULL,
    [dateInvited]   DATE         NULL,
    [inviteStatus]  INT          NOT NULL,
    [userEmail]     VARCHAR (50) NULL,
    [acceptedDate]  DATE         NULL
);

