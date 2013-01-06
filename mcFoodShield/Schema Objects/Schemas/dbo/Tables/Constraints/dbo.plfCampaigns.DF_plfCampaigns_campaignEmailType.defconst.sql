ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignEmailType] DEFAULT ('NOTSET') FOR [campaignEmailType];

