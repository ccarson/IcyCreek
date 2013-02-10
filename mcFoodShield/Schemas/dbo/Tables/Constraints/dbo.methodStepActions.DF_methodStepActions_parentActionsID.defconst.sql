ALTER TABLE [dbo].[methodStepActions]
    ADD CONSTRAINT [DF_methodStepActions_parentActionsID] DEFAULT ((0)) FOR [parentActionsID];

