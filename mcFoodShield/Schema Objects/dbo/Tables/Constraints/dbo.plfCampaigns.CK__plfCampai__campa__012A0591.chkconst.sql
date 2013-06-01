ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__012A0591] CHECK ([campaignEmailType]='NOTSET' OR [campaignEmailType]='TEXT' OR [campaignEmailType]='MIXED' OR [campaignEmailType]='HTML');

