ALTER TABLE [dbo].[plfCampaignSubscribers]
    ADD CONSTRAINT [DF_plfCampaignSubscribers_linkClickCount] DEFAULT ('0') FOR [linkClickCount];

