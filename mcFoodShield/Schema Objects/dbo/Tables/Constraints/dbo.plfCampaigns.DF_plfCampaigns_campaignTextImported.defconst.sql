ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignTextImported] DEFAULT ('NO') FOR [campaignTextImported];

