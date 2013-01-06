ALTER TABLE [dbo].[sme_categories_topics]
    ADD CONSTRAINT [DF_smeTopicsCategories_createdBy] DEFAULT ((-1)) FOR [createdBy];

