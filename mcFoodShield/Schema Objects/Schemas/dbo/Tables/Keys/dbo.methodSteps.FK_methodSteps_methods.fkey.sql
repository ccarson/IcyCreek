ALTER TABLE [dbo].[methodSteps]
    ADD CONSTRAINT [FK_methodSteps_methods] FOREIGN KEY ([methodsID]) REFERENCES [dbo].[methods] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

