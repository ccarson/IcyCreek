CREATE TABLE [dbo].[plfCampaignSubscriberLists] (
    [campaignSubscriberListId] INT      IDENTITY (1, 1) NOT NULL,
    [campaignId]               INT      NULL,
    [subscriberListId]         INT      NULL,
    [subscriberListDateAdded]  DATETIME NULL
);

