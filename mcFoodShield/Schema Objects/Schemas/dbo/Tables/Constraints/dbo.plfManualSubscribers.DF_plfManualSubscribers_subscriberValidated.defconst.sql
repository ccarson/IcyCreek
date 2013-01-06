ALTER TABLE [dbo].[plfManualSubscribers]
    ADD CONSTRAINT [DF_plfManualSubscribers_subscriberValidated] DEFAULT ('YES') FOR [subscriberValidated];

