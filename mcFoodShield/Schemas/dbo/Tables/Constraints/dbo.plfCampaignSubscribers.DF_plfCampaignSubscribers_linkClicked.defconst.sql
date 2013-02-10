ALTER TABLE [dbo].[plfCampaignSubscribers]
    ADD CONSTRAINT [DF_plfCampaignSubscribers_linkClicked] DEFAULT ('NO') FOR [linkClicked];

