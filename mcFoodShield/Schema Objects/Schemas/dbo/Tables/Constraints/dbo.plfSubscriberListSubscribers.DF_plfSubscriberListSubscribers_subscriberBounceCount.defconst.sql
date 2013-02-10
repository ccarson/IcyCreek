ALTER TABLE [dbo].[plfSubscriberListSubscribers]
    ADD CONSTRAINT [DF_plfSubscriberListSubscribers_subscriberBounceCount] DEFAULT ('0') FOR [subscriberBounceCount];

