ALTER TABLE [dbo].[MethodStepReferenceDataTypes]
    ADD CONSTRAINT [DF_MethodReferenceDataTypes_StepLevel] DEFAULT (N'B') FOR [StepLevel];

