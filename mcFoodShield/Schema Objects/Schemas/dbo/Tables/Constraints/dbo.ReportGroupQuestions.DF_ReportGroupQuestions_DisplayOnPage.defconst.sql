ALTER TABLE [dbo].[ReportGroupQuestions]
    ADD CONSTRAINT [DF_ReportGroupQuestions_DisplayOnPage] DEFAULT ((0)) FOR [DisplayOnPage];

