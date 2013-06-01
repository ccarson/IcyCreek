ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__0C9BB83D] CHECK ([campaignContainsJavascript]='YES' OR [campaignContainsJavascript]='NO');

