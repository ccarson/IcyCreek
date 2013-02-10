ALTER TABLE [dbo].[plfManualSubscribers]
    ADD CONSTRAINT [DF_plfManualSubscribers_subscriberBounced] DEFAULT ('NO') FOR [subscriberBounced];

