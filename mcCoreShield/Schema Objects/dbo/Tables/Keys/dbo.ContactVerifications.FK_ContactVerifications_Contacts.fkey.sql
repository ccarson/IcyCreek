ALTER TABLE [dbo].[ContactVerifications]
    ADD CONSTRAINT [FK_ContactVerifications_Contacts] FOREIGN KEY ([contactsID]) REFERENCES [dbo].[Contacts] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
ALTER TABLE [dbo].[ContactVerifications] NOCHECK CONSTRAINT [FK_ContactVerifications_Contacts];

