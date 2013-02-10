ALTER TABLE [dbo].[mc_contact_sme_topics]
    ADD CONSTRAINT [FK_smeExpertsTopics_cLevelOfExpertise] FOREIGN KEY ([cLevelOfExpertiseID]) REFERENCES [dbo].[cLevelOfExpertise] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

