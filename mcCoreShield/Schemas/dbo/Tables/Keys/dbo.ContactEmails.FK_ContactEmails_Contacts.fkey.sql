ALTER TABLE [dbo].[ContactEmails]
    ADD CONSTRAINT [FK_ContactEmails_Contacts] FOREIGN KEY ([contactsID]) REFERENCES [dbo].[Contacts] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
ALTER TABLE [dbo].[ContactEmails] NOCHECK CONSTRAINT [FK_ContactEmails_Contacts];

