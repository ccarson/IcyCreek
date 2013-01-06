ALTER TABLE [dbo].[plfSubscriberListSubscribers]
    ADD CONSTRAINT [DF_plfSubscriberListSubscribers_subscriberValidated] DEFAULT ('YES') FOR [subscriberValidated];

