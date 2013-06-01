ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__0F7824E8] CHECK ([campaignContainsUnsubscribeLink]='YES' OR [campaignContainsUnsubscribeLink]='NO');

