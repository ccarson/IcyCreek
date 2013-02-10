ALTER TABLE [dbo].[ContactOrgRoles]
    ADD CONSTRAINT [FK_ContactOrgRoles_Roles] FOREIGN KEY ([rolesID]) REFERENCES [dbo].[Roles] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
ALTER TABLE [dbo].[ContactOrgRoles] NOCHECK CONSTRAINT [FK_ContactOrgRoles_Roles];

