ALTER TABLE [dbo].[smeUsers]
    ADD CONSTRAINT [fk_levelID] FOREIGN KEY ([levelID]) REFERENCES [dbo].[smeLevels] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

