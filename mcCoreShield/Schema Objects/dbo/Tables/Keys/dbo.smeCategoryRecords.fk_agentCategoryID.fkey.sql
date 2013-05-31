ALTER TABLE [dbo].[smeCategoryRecords]
    ADD CONSTRAINT [fk_agentCategoryID] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[smeCategories] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

