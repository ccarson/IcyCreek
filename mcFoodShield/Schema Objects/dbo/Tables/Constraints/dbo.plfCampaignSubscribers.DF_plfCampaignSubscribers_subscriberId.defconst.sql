ALTER TABLE [dbo].[plfCampaignSubscribers]
    ADD CONSTRAINT [DF_plfCampaignSubscribers_subscriberId] DEFAULT ('0') FOR [subscriberId];

