ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignHTMLImported] DEFAULT ('NO') FOR [campaignHTMLImported];

