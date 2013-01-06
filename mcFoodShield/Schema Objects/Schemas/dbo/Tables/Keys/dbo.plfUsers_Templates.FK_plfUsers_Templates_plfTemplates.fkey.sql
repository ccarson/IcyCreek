ALTER TABLE [dbo].[plfUsers_Templates]
    ADD CONSTRAINT [FK_plfUsers_Templates_plfTemplates] FOREIGN KEY ([templateId]) REFERENCES [dbo].[plfTemplates] ([templateId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

