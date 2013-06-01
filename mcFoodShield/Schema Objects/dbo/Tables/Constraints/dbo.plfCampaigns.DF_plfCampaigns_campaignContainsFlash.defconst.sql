ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignContainsFlash] DEFAULT ('NO') FOR [campaignContainsFlash];

