ALTER TABLE [dbo].[plfCampaignSubscribers]
    ADD CONSTRAINT [DF_plfCampaignSubscribers_openedEmailCount] DEFAULT ('0') FOR [openedEmailCount];

