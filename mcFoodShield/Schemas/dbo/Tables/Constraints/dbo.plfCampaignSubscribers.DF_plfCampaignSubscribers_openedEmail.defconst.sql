ALTER TABLE [dbo].[plfCampaignSubscribers]
    ADD CONSTRAINT [DF_plfCampaignSubscribers_openedEmail] DEFAULT ('NO') FOR [openedEmail];

