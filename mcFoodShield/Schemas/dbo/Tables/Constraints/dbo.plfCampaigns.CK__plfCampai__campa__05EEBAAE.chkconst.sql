ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__05EEBAAE] CHECK ([campaignSent]='YES' OR [campaignSent]='NO');

