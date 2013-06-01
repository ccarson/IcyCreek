ALTER TABLE [dbo].[security_roles]
    ADD CONSTRAINT [security_roles$FK_security_roles_security_groups] FOREIGN KEY ([group_id]) REFERENCES [dbo].[security_groups] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

