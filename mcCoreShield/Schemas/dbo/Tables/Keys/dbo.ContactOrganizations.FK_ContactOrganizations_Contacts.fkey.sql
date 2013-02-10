ALTER TABLE [dbo].[ContactOrganizations]
    ADD CONSTRAINT [FK_ContactOrganizations_Contacts] FOREIGN KEY ([contactsID]) REFERENCES [dbo].[Contacts] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
ALTER TABLE [dbo].[ContactOrganizations] NOCHECK CONSTRAINT [FK_ContactOrganizations_Contacts];

