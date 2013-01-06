ALTER TABLE [dbo].[sme_categories_topics]
    ADD CONSTRAINT [FK_smeCategoriesTopics_smeCategories] FOREIGN KEY ([smeCategoriesID]) REFERENCES [dbo].[sme_categories] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

