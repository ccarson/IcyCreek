ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignNumberOfUnsubscribers] DEFAULT ('0') FOR [campaignNumberOfUnsubscribers];

