ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__11606D5A] CHECK ([campaignContainsFlash]='YES' OR [campaignContainsFlash]='NO');

