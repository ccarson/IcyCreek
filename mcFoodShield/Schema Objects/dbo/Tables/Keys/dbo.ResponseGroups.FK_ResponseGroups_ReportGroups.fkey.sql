ALTER TABLE [dbo].[ResponseGroups]
    ADD CONSTRAINT [FK_ResponseGroups_ReportGroups] FOREIGN KEY ([reportGroupsID]) REFERENCES [dbo].[ReportGroups] ([reportGroupsID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

