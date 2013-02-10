ALTER TABLE [dbo].[security_matrix]
    ADD CONSTRAINT [security_matrix$FK_security_matrix_security_roles] FOREIGN KEY ([role_id]) REFERENCES [dbo].[security_roles] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

