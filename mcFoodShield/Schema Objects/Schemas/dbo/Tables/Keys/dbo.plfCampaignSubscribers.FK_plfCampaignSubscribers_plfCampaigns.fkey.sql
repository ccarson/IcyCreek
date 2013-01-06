ALTER TABLE [dbo].[plfCampaignSubscribers]
    ADD CONSTRAINT [FK_plfCampaignSubscribers_plfCampaigns] FOREIGN KEY ([campaignId]) REFERENCES [dbo].[plfCampaigns] ([campaignId]) ON DELETE CASCADE ON UPDATE CASCADE;

