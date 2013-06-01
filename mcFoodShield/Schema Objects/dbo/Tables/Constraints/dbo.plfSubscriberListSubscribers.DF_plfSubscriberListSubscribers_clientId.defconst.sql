ALTER TABLE [dbo].[plfSubscriberListSubscribers]
    ADD CONSTRAINT [DF_plfSubscriberListSubscribers_clientId] DEFAULT ('0') FOR [clientId];

