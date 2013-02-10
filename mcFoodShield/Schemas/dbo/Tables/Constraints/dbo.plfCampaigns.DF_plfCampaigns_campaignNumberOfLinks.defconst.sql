ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignNumberOfLinks] DEFAULT ('0') FOR [campaignNumberOfLinks];

