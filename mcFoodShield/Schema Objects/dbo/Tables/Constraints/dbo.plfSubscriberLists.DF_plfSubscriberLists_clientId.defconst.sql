ALTER TABLE [dbo].[plfSubscriberLists]
    ADD CONSTRAINT [DF_plfSubscriberLists_clientId] DEFAULT ('0') FOR [clientId];

