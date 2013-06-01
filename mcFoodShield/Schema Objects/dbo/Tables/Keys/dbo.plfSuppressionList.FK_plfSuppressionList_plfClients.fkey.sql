ALTER TABLE [dbo].[plfSuppressionList]
    ADD CONSTRAINT [FK_plfSuppressionList_plfClients] FOREIGN KEY ([clientId]) REFERENCES [dbo].[plfClients] ([clientId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

