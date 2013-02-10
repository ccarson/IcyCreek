ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignContainsImages] DEFAULT ('NO') FOR [campaignContainsImages];

