ALTER TABLE [dbo].[methodsStepsActionsComments]
    ADD CONSTRAINT [FK_methodsStepsActionsComments_methodStepActions] FOREIGN KEY ([actionsID]) REFERENCES [dbo].[methodStepActions] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

