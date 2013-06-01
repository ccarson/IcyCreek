ALTER TABLE [dbo].[mc_contact_credentials]
    ADD CONSTRAINT [FK_smeCredentials_cCIPCodes_Major] FOREIGN KEY ([cCIPCodes_Major]) REFERENCES [dbo].[c_CIP_codes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

