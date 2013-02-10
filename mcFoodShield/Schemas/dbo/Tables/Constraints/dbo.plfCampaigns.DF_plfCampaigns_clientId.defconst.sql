ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_clientId] DEFAULT ('0') FOR [clientId];

