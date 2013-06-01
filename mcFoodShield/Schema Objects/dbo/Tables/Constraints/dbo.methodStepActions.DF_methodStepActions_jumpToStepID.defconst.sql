ALTER TABLE [dbo].[methodStepActions]
    ADD CONSTRAINT [DF_methodStepActions_jumpToStepID] DEFAULT ((0)) FOR [jumpToStepID];

