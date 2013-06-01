ALTER TABLE [dbo].[plfCampaignSubscriberLists]
    ADD CONSTRAINT [DF_plfCampaignSubscriberLists_campaignId] DEFAULT ('0') FOR [campaignId];

