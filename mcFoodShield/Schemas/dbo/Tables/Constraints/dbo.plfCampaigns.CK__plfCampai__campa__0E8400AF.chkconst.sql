ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__0E8400AF] CHECK ([campaignContainsImages]='YES' OR [campaignContainsImages]='NO');

