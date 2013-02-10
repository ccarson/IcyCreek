ALTER TABLE [dbo].[security_matrix]
    ADD CONSTRAINT [security_matrix$FK_security_matrix_security_assets] FOREIGN KEY ([asset_id]) REFERENCES [dbo].[security_assets] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

