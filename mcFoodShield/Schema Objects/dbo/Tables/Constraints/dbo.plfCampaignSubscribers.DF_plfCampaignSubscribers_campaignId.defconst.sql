ALTER TABLE [dbo].[plfCampaignSubscribers]
    ADD CONSTRAINT [DF_plfCampaignSubscribers_campaignId] DEFAULT ('0') FOR [campaignId];

