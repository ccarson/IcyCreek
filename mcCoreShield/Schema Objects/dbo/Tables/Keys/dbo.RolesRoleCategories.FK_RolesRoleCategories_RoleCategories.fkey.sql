ALTER TABLE [dbo].[RolesRoleCategories]
    ADD CONSTRAINT [FK_RolesRoleCategories_RoleCategories] FOREIGN KEY ([roleCategoriesID]) REFERENCES [dbo].[RoleCategories] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
ALTER TABLE [dbo].[RolesRoleCategories] NOCHECK CONSTRAINT [FK_RolesRoleCategories_RoleCategories];

