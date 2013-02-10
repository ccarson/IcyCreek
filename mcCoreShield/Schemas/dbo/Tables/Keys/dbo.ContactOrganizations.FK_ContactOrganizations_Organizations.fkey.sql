ALTER TABLE [dbo].[ContactOrganizations]
    ADD CONSTRAINT [FK_ContactOrganizations_Organizations] FOREIGN KEY ([organizationsID]) REFERENCES [dbo].[Organizations] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

