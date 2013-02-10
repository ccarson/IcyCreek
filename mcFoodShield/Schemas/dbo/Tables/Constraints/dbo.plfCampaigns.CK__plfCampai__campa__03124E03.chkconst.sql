ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__03124E03] CHECK ([campaignHTMLLocation]='NOTSET' OR [campaignHTMLLocation]='FILE' OR [campaignHTMLLocation]='TEMPLATE' OR [campaignHTMLLocation]='URL');

