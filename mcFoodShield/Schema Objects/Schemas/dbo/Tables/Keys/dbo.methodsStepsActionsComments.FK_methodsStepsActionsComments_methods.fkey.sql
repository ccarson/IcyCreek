ALTER TABLE [dbo].[methodsStepsActionsComments]
    ADD CONSTRAINT [FK_methodsStepsActionsComments_methods] FOREIGN KEY ([methodsID]) REFERENCES [dbo].[methods] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

