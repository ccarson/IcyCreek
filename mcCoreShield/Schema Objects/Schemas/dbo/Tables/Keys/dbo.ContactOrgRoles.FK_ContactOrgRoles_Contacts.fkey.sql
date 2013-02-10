ALTER TABLE [dbo].[ContactOrgRoles]
    ADD CONSTRAINT [FK_ContactOrgRoles_Contacts] FOREIGN KEY ([contactsID]) REFERENCES [dbo].[Contacts] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
ALTER TABLE [dbo].[ContactOrgRoles] NOCHECK CONSTRAINT [FK_ContactOrgRoles_Contacts];

