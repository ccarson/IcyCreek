ALTER TABLE [dbo].[OrgLocations]
    ADD CONSTRAINT [FK_OrgLocations_Organizations] FOREIGN KEY ([organizationsID]) REFERENCES [dbo].[Organizations] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

