ALTER TABLE [dbo].[ContactPhones]
    ADD CONSTRAINT [FK_ContactPhones_Contacts] FOREIGN KEY ([contactsID]) REFERENCES [dbo].[Contacts] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
ALTER TABLE [dbo].[ContactPhones] NOCHECK CONSTRAINT [FK_ContactPhones_Contacts];

