ALTER TABLE [dbo].[ReportGroupQuestions]
    ADD CONSTRAINT [DF_ReportGroupQuestions_isSummaryQuestion] DEFAULT ((0)) FOR [isSummaryQuestion];

