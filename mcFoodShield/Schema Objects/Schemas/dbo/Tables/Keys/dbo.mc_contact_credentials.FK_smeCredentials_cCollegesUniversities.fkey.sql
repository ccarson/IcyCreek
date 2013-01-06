ALTER TABLE [dbo].[mc_contact_credentials]
    ADD CONSTRAINT [FK_smeCredentials_cCollegesUniversities] FOREIGN KEY ([cCollegesUniversitiesID]) REFERENCES [dbo].[c_colleges_universities] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

