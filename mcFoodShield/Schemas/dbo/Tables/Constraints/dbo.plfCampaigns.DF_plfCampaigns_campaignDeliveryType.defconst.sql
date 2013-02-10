ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignDeliveryType] DEFAULT ('NOTSET') FOR [campaignDeliveryType];

