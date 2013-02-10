ALTER TABLE [dbo].[ContactAddresses]
    ADD CONSTRAINT [FK_ContactAddresses_Contacts] FOREIGN KEY ([contactsID]) REFERENCES [dbo].[Contacts] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
ALTER TABLE [dbo].[ContactAddresses] NOCHECK CONSTRAINT [FK_ContactAddresses_Contacts];

