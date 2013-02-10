ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [CK__plfCampai__campa__08CB2759] CHECK ([campaignConfirmationEmailSent]='YES' OR [campaignConfirmationEmailSent]='NO');

