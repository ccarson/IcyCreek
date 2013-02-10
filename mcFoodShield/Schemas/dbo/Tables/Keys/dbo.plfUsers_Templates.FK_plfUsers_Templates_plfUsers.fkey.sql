ALTER TABLE [dbo].[plfUsers_Templates]
    ADD CONSTRAINT [FK_plfUsers_Templates_plfUsers] FOREIGN KEY ([userId]) REFERENCES [dbo].[plfUsers] ([userId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

