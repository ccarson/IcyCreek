ALTER TABLE [dbo].[plfManualSubscribers]
    ADD CONSTRAINT [FK_plfManualSubscribers_plfCampaigns] FOREIGN KEY ([campaignId]) REFERENCES [dbo].[plfCampaigns] ([campaignId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

