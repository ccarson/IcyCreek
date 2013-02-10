ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__0AB36FCB] CHECK ([campaignStep2Complete]='YES' OR [campaignStep2Complete]='NO');

