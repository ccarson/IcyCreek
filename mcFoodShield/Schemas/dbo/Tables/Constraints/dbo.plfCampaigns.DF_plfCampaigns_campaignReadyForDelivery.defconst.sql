ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignReadyForDelivery] DEFAULT ('NO') FOR [campaignReadyForDelivery];

