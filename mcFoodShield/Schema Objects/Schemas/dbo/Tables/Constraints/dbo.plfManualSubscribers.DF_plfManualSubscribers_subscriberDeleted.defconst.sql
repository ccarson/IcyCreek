ALTER TABLE [dbo].[plfManualSubscribers]
    ADD CONSTRAINT [DF_plfManualSubscribers_subscriberDeleted] DEFAULT ('NO') FOR [subscriberDeleted];

