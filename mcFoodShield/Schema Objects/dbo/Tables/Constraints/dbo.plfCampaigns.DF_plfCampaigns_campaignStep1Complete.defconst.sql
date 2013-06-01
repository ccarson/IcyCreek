ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignStep1Complete] DEFAULT ('NO') FOR [campaignStep1Complete];

