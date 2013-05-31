ALTER TABLE [dbo].[smeCategories]
    ADD CONSTRAINT [fk_typeID] FOREIGN KEY ([typeID]) REFERENCES [dbo].[smeTypes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

