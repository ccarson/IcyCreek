ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [FK_plfCampaigns_plfClients] FOREIGN KEY ([clientId]) REFERENCES [dbo].[plfClients] ([clientId]) ON DELETE CASCADE ON UPDATE CASCADE;

