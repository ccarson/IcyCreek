ALTER TABLE [dbo].[plfManualSubscribers]
    ADD CONSTRAINT [FK_plfManualSubscribers_plfClients] FOREIGN KEY ([clientId]) REFERENCES [dbo].[plfClients] ([clientId]) ON DELETE CASCADE ON UPDATE CASCADE;

