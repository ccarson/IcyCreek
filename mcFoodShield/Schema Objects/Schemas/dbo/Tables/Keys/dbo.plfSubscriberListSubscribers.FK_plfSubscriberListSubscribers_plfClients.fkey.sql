ALTER TABLE [dbo].[plfSubscriberListSubscribers]
    ADD CONSTRAINT [FK_plfSubscriberListSubscribers_plfClients] FOREIGN KEY ([clientId]) REFERENCES [dbo].[plfClients] ([clientId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

