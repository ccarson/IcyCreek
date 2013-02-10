ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignSent] DEFAULT ('NO') FOR [campaignSent];

