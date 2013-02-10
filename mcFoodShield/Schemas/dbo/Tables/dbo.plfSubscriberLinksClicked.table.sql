CREATE TABLE [dbo].[plfSubscriberLinksClicked] (
    [subscriberlinkId] INT      IDENTITY (1, 1) NOT NULL,
    [linkId]           INT      NULL,
    [subscriberId]     INT      NULL,
    [dateClicked]      DATETIME NULL
);

