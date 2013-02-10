ALTER TABLE [dbo].[plfManualSubscribers]
    ADD CONSTRAINT [DF_plfManualSubscribers_clientId] DEFAULT ('0') FOR [clientId];

