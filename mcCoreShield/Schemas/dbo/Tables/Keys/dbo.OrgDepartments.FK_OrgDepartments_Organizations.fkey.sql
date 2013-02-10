ALTER TABLE [dbo].[OrgDepartments]
    ADD CONSTRAINT [FK_OrgDepartments_Organizations] FOREIGN KEY ([organizationsID]) REFERENCES [dbo].[Organizations] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

