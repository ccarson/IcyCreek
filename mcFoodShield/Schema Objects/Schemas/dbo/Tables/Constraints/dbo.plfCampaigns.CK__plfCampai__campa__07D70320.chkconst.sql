ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__07D70320] CHECK ([campaignReadyForDelivery]='YES' OR [campaignReadyForDelivery]='NO');

