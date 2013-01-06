ALTER TABLE [dbo].[plfCampaignSubscriberLists]
    ADD CONSTRAINT [DF_plfCampaignSubscriberLists_subscriberListId] DEFAULT ('0') FOR [subscriberListId];

