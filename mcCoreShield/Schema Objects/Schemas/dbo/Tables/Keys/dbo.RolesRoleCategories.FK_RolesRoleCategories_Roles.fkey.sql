ALTER TABLE [dbo].[RolesRoleCategories]
    ADD CONSTRAINT [FK_RolesRoleCategories_Roles] FOREIGN KEY ([rolesID]) REFERENCES [dbo].[Roles] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
ALTER TABLE [dbo].[RolesRoleCategories] NOCHECK CONSTRAINT [FK_RolesRoleCategories_Roles];

