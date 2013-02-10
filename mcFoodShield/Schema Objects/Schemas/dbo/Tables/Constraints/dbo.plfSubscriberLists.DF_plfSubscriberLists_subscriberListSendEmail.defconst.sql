ALTER TABLE [dbo].[plfSubscriberLists]
    ADD CONSTRAINT [DF_plfSubscriberLists_subscriberListSendEmail] DEFAULT ('NO') FOR [subscriberListSendEmail];

