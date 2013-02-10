ALTER TABLE [dbo].[ReportGroupQuestionIndicators]
    ADD CONSTRAINT [FK_ReportGroupQuestionIndicators_ReportGroupQuestions] FOREIGN KEY ([reportGroupQuestionsID]) REFERENCES [dbo].[ReportGroupQuestions] ([reportGroupQuestionsID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

