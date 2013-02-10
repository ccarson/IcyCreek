ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignContainsExternalCSS] DEFAULT ('NO') FOR [campaignContainsExternalCSS];

