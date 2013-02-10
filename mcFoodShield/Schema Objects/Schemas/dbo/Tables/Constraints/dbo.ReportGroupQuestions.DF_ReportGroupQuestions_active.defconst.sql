ALTER TABLE [dbo].[ReportGroupQuestions]
    ADD CONSTRAINT [DF_ReportGroupQuestions_active] DEFAULT ((1)) FOR [active];

