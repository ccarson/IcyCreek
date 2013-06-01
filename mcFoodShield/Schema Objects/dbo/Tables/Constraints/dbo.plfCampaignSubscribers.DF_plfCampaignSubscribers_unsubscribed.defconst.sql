ALTER TABLE [dbo].[plfCampaignSubscribers]
    ADD CONSTRAINT [DF_plfCampaignSubscribers_unsubscribed] DEFAULT ('NO') FOR [unsubscribed];

