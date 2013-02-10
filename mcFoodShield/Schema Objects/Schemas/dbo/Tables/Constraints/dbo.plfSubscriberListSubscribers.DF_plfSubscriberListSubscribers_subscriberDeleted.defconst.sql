ALTER TABLE [dbo].[plfSubscriberListSubscribers]
    ADD CONSTRAINT [DF_plfSubscriberListSubscribers_subscriberDeleted] DEFAULT ('NO') FOR [subscriberDeleted];

