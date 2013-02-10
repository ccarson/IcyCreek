ALTER TABLE [dbo].[plfCampaignSubscribers]
    ADD CONSTRAINT [DF_plfCampaignSubscribers_userOpenMethod] DEFAULT ('IMAGE') FOR [userOpenMethod];

