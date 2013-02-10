ALTER TABLE [dbo].[smeUsers]
    ADD CONSTRAINT [fk_userID] FOREIGN KEY ([userID]) REFERENCES [dbo].[Contacts] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

