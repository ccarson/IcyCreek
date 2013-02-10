ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__04FA9675] CHECK ([campaignEmbedImages]='YES' OR [campaignEmbedImages]='NO');

