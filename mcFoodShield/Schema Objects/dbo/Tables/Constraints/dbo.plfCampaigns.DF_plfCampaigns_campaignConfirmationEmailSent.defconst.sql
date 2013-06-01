ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignConfirmationEmailSent] DEFAULT ('NO') FOR [campaignConfirmationEmailSent];

