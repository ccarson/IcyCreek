ALTER TABLE [dbo].[mc_contact_credentials]
    ADD CONSTRAINT [FK_smeCredentials_cDegrees] FOREIGN KEY ([cDegreesID]) REFERENCES [dbo].[c_degrees] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

