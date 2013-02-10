ALTER TABLE [dbo].[methodStepActions]
    ADD CONSTRAINT [DF_methodStepActions_jumpToStepLevel] DEFAULT (N'P') FOR [jumpToStepLevel];

