ALTER TABLE [dbo].[plfUsers_Clients]
    ADD CONSTRAINT [FK_plfUsers_Clients_plfUsers] FOREIGN KEY ([userId]) REFERENCES [dbo].[plfUsers] ([userId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

