ALTER TABLE [dbo].[OrganizationSystems]
    ADD CONSTRAINT [FK_OrganizationSystems_Systems] FOREIGN KEY ([systemID]) REFERENCES [dbo].[transitionSystems] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

