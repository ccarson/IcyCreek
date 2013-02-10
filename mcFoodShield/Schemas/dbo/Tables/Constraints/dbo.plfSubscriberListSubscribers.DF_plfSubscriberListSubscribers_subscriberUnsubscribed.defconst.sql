ALTER TABLE [dbo].[plfSubscriberListSubscribers]
    ADD CONSTRAINT [DF_plfSubscriberListSubscribers_subscriberUnsubscribed] DEFAULT ('NO') FOR [subscriberUnsubscribed];

