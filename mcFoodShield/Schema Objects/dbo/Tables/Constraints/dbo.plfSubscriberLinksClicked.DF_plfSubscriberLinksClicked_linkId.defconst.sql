ALTER TABLE [dbo].[plfSubscriberLinksClicked]
    ADD CONSTRAINT [DF_plfSubscriberLinksClicked_linkId] DEFAULT ('0') FOR [linkId];

