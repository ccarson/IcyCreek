ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__06E2DEE7] CHECK ([campaignDeliveryType]='NOTSET' OR [campaignDeliveryType]='LATER' OR [campaignDeliveryType]='NOW');

