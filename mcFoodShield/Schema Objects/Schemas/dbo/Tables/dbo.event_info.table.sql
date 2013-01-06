CREATE TABLE [dbo].[event_info] (
    [event_infoID]     INT           IDENTITY (6, 1) NOT NULL,
    [userID]           INT           NULL,
    [eventName]        VARCHAR (100) NULL,
    [eventImage]       VARCHAR (100) NULL,
    [eventDescription] VARCHAR (MAX) NULL,
    [eventType]        VARCHAR (100) NULL,
    [eventStartDate]   DATETIME2 (0) NULL,
    [eventEndDate]     DATETIME2 (0) NULL,
    [eventLocation]    VARCHAR (150) NULL,
    [eventStreet]      VARCHAR (100) NULL,
    [eventCity]        VARCHAR (50)  NULL,
    [eventWebsite]     VARCHAR (100) NULL,
    [eventPhone]       VARCHAR (25)  NULL,
    [eventFK]          INT           NULL,
    [eventPrivacy]     VARCHAR (10)  NULL,
    [disableRSVP]      INT           NOT NULL,
    [hideGuest]        INT           NOT NULL,
    [deleted]          INT           NOT NULL
);

