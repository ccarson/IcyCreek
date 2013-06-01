ALTER TABLE [dbo].[methodStepActionDownloads]
    ADD CONSTRAINT [FK_methodStepActionDownloads_methodStepActions] FOREIGN KEY ([methodStepActionsID]) REFERENCES [dbo].[methodStepActions] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

