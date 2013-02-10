ALTER TABLE [dbo].[ReportGroupQuestions]
    ADD CONSTRAINT [FK_ReportGroupQuestions_ReportGroups] FOREIGN KEY ([reportGroupsID]) REFERENCES [dbo].[ReportGroups] ([reportGroupsID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

