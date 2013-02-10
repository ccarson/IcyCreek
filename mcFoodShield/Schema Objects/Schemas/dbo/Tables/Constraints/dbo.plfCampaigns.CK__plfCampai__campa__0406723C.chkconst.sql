ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__0406723C] CHECK ([campaignTextImported]='YES' OR [campaignTextImported]='NO');

