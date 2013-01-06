ALTER TABLE [dbo].[plfManualSubscribers]
    ADD CONSTRAINT [DF_plfManualSubscribers_subscriberBounceCount] DEFAULT ('0') FOR [subscriberBounceCount];

