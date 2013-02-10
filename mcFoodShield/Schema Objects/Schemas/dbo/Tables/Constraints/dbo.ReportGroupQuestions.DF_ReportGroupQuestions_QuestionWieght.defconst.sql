ALTER TABLE [dbo].[ReportGroupQuestions]
    ADD CONSTRAINT [DF_ReportGroupQuestions_QuestionWieght] DEFAULT ((1)) FOR [QuestionWieght];

