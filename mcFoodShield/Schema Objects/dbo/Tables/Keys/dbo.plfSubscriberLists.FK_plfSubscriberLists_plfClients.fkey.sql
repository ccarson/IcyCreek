ALTER TABLE [dbo].[plfSubscriberLists]
    ADD CONSTRAINT [FK_plfSubscriberLists_plfClients] FOREIGN KEY ([clientId]) REFERENCES [dbo].[plfClients] ([clientId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

