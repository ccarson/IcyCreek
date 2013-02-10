ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignStep3Complete] DEFAULT ('NO') FOR [campaignStep3Complete];

