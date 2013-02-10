ALTER TABLE [dbo].[mc_contact_sme_topics]
    ADD CONSTRAINT [FK_smeExpertsTopics_smeTopics] FOREIGN KEY ([smeTopicsID]) REFERENCES [dbo].[sme_topics] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

