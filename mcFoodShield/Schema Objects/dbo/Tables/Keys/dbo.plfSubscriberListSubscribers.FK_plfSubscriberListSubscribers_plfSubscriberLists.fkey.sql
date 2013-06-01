ALTER TABLE [dbo].[plfSubscriberListSubscribers]
    ADD CONSTRAINT [FK_plfSubscriberListSubscribers_plfSubscriberLists] FOREIGN KEY ([subscriberListId]) REFERENCES [dbo].[plfSubscriberLists] ([subscriberListId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

