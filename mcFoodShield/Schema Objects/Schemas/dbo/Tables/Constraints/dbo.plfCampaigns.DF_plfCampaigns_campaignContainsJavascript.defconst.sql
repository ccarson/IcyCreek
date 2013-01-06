ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignContainsJavascript] DEFAULT ('NO') FOR [campaignContainsJavascript];

