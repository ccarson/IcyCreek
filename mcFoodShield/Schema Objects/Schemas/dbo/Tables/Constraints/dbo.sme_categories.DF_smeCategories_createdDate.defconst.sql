ALTER TABLE [dbo].[sme_categories]
    ADD CONSTRAINT [DF_smeCategories_createdDate] DEFAULT (getdate()) FOR [createdDate];

