ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignCreatedByUserId] DEFAULT ('0') FOR [campaignCreatedByUserId];

