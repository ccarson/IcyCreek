ALTER TABLE [dbo].[methodSteps]
    ADD CONSTRAINT [DF_methodSteps_incPluginComment] DEFAULT ((1)) FOR [incPluginComment];

