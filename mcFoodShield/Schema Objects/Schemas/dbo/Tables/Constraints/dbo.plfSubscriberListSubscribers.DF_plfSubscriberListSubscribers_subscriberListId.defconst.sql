ALTER TABLE [dbo].[plfSubscriberListSubscribers]
    ADD CONSTRAINT [DF_plfSubscriberListSubscribers_subscriberListId] DEFAULT ('0') FOR [subscriberListId];

