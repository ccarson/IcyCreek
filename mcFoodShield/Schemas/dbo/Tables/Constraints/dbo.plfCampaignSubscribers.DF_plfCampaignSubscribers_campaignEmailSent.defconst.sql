ALTER TABLE [dbo].[plfCampaignSubscribers]
    ADD CONSTRAINT [DF_plfCampaignSubscribers_campaignEmailSent] DEFAULT ('NO') FOR [campaignEmailSent];

