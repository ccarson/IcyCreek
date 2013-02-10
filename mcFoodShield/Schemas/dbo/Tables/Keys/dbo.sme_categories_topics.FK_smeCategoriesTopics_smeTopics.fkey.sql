ALTER TABLE [dbo].[sme_categories_topics]
    ADD CONSTRAINT [FK_smeCategoriesTopics_smeTopics] FOREIGN KEY ([smeTopicsID]) REFERENCES [dbo].[sme_topics] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

