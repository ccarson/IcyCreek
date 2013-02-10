ALTER TABLE [dbo].[security_matrix]
    ADD CONSTRAINT [security_matrix$FK_security_matrix_security_functions] FOREIGN KEY ([func_id]) REFERENCES [dbo].[security_functions] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

