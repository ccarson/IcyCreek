ALTER TABLE [dbo].[sme_categories_topics]
    ADD CONSTRAINT [DF_smeTopicsCategories_createdDate] DEFAULT (getdate()) FOR [createdDate];

