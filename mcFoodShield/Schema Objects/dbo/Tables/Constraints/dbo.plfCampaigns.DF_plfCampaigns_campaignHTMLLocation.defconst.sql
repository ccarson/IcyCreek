ALTER TABLE [dbo].[plfCampaigns]
    ADD CONSTRAINT [DF_plfCampaigns_campaignHTMLLocation] DEFAULT ('NOTSET') FOR [campaignHTMLLocation];

