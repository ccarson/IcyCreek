ALTER TABLE [dbo].[plfLinksClicked]
    ADD CONSTRAINT [FK_plfLinksClicked_plfCampaigns] FOREIGN KEY ([campaignId]) REFERENCES [dbo].[plfCampaigns] ([campaignId]) ON DELETE CASCADE ON UPDATE CASCADE;

