ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignContainsUnsubscribeLink] DEFAULT ('NO') FOR [campaignContainsUnsubscribeLink];

