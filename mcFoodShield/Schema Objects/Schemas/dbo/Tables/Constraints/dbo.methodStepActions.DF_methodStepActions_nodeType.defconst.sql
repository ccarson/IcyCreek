ALTER TABLE [dbo].[methodStepActions]
    ADD CONSTRAINT [DF_methodStepActions_nodeType] DEFAULT (N'button') FOR [nodeType];

