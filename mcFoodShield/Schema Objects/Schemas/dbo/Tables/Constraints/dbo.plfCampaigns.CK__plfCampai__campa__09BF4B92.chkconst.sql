ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__09BF4B92] CHECK ([campaignStep1Complete]='YES' OR [campaignStep1Complete]='NO');

