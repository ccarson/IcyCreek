ALTER TABLE [dbo].[plfCampaignSubscribers]
    ADD CONSTRAINT [DF_plfCampaignSubscribers_bounced] DEFAULT ('NO') FOR [bounced];

