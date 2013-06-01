ALTER TABLE [dbo].[plfCampaignSubscriberLists]
    ADD CONSTRAINT [FK_plfCampaignSubscriberLists_plfSubscriberLists] FOREIGN KEY ([subscriberListId]) REFERENCES [dbo].[plfSubscriberLists] ([subscriberListId]) ON DELETE CASCADE ON UPDATE CASCADE;

