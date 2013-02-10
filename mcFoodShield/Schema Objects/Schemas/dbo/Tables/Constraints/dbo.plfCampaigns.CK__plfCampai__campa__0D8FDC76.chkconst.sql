ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__0D8FDC76] CHECK ([campaignContainsExternalCSS]='YES' OR [campaignContainsExternalCSS]='NO');

