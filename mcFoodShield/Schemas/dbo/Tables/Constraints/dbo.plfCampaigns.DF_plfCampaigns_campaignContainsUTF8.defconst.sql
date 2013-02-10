ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignContainsUTF8] DEFAULT ('NO') FOR [campaignContainsUTF8];

