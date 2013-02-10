ALTER TABLE [dbo].[c_CIP_codes]
    ADD CONSTRAINT [FK_cCIPCodes_cCIPFamilies] FOREIGN KEY ([cCIPFamiliesID]) REFERENCES [dbo].[c_CIP_families] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

