ALTER TABLE [dbo].[plfCampaignSubscribers]
    ADD CONSTRAINT [DF_plfCampaignSubscribers_subscriberListId] DEFAULT ('0') FOR [subscriberListId];

