ALTER TABLE [dbo].[plfUsers_Clients]
    ADD CONSTRAINT [FK_plfUsers_Clients_plfClients] FOREIGN KEY ([clientId]) REFERENCES [dbo].[plfClients] ([clientId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

