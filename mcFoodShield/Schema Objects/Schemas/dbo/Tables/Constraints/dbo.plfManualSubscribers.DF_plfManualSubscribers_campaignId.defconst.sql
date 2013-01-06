ALTER TABLE [dbo].[plfManualSubscribers]
    ADD CONSTRAINT [DF_plfManualSubscribers_campaignId] DEFAULT ('0') FOR [campaignId];

