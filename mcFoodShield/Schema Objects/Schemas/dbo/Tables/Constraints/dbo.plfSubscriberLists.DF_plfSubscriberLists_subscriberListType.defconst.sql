ALTER TABLE [dbo].[plfSubscriberLists]
    ADD CONSTRAINT [DF_plfSubscriberLists_subscriberListType] DEFAULT ('BASIC') FOR [subscriberListType];

