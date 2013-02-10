ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignStep2Complete] DEFAULT ('NO') FOR [campaignStep2Complete];

