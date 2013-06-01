ALTER TABLE [dbo].[ReportGroupOptions]
    ADD CONSTRAINT [FK_ReportGroupOptions_ReportGroupQuestions] FOREIGN KEY ([reportGroupQuestionsID]) REFERENCES [dbo].[ReportGroupQuestions] ([reportGroupQuestionsID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

