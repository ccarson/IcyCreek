ALTER TABLE [dbo].[plfSubscriberListSubscribers]
    ADD CONSTRAINT [DF_plfSubscriberListSubscribers_subscriberBounced] DEFAULT ('NO') FOR [subscriberBounced];

