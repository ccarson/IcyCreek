ALTER TABLE [dbo].[plfSubscriberLinksClicked]
    ADD CONSTRAINT [DF_plfSubscriberLinksClicked_subscriberId] DEFAULT ('0') FOR [subscriberId];

