ALTER TABLE [dbo].[ReportGroupQuestions]
    ADD CONSTRAINT [DF_ReportGroupQuestions_reportGroupQuestionsID] DEFAULT (newsequentialid()) FOR [reportGroupQuestionsID];

