ALTER TABLE [dbo].[plfCampaignSubscribers]
    ADD CONSTRAINT [DF_plfCampaignSubscribers_subscriberType] DEFAULT ('MANUAL') FOR [subscriberType];

