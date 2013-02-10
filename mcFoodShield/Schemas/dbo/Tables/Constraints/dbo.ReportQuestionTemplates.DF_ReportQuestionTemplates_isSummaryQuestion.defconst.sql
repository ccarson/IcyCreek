ALTER TABLE [dbo].[ReportQuestionTemplates]
    ADD CONSTRAINT [DF_ReportQuestionTemplates_isSummaryQuestion] DEFAULT ((0)) FOR [isSummaryQuestion];

