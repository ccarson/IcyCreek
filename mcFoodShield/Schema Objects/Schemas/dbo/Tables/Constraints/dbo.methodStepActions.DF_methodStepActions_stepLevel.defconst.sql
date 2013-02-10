ALTER TABLE [dbo].[methodStepActions]
    ADD CONSTRAINT [DF_methodStepActions_stepLevel] DEFAULT ((1)) FOR [stepLevel];

