ALTER TABLE [dbo].[methodStepMetaData]
    ADD CONSTRAINT [DF_methodStepMetaData_StepLevel] DEFAULT ('P') FOR [StepLevel];

