ALTER TABLE [dbo].[methodsStepsActionsComments]
    ADD CONSTRAINT [FK_methodsStepsActionsComments_methodSteps] FOREIGN KEY ([stepsID]) REFERENCES [dbo].[methodSteps] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

