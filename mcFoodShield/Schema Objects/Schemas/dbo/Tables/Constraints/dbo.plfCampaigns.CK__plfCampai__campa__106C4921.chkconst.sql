ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__106C4921] CHECK ([campaignContainsUTF8]='YES' OR [campaignContainsUTF8]='NO');

