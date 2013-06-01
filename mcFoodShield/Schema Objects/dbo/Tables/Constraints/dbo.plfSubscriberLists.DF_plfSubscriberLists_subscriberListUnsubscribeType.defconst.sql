ALTER TABLE [dbo].[plfSubscriberLists]
    ADD CONSTRAINT [DF_plfSubscriberLists_subscriberListUnsubscribeType] DEFAULT ('SUPPRESS') FOR [subscriberListUnsubscribeType];

