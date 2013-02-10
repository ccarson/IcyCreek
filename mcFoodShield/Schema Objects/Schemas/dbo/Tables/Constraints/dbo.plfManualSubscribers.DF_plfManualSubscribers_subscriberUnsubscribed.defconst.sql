ALTER TABLE [dbo].[plfManualSubscribers]
    ADD CONSTRAINT [DF_plfManualSubscribers_subscriberUnsubscribed] DEFAULT ('NO') FOR [subscriberUnsubscribed];

