ALTER TABLE [dbo].[plfCampaignSubscriberLists]
    ADD CONSTRAINT [FK_plfCampaignSubscriberLists_plfCampaigns] FOREIGN KEY ([campaignId]) REFERENCES [dbo].[plfCampaigns] ([campaignId]) ON DELETE CASCADE ON UPDATE CASCADE;

