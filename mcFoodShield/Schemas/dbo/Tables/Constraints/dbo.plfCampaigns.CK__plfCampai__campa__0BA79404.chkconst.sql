ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__0BA79404] CHECK ([campaignStep3Complete]='YES' OR [campaignStep3Complete]='NO');

