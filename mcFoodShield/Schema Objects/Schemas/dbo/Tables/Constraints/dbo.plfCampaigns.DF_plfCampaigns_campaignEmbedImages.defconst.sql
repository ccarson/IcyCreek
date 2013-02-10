ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignEmbedImages] DEFAULT ('NO') FOR [campaignEmbedImages];

