ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__021E29CA] CHECK ([campaignHTMLImported]='YES' OR [campaignHTMLImported]='NO');

