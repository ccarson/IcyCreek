ALTER TABLE [dbo].[ReportGroupQuestions]
    ADD CONSTRAINT [DF_ReportGroupQuestions_hasSkipLogic] DEFAULT ((0)) FOR [hasSkipLogic];

