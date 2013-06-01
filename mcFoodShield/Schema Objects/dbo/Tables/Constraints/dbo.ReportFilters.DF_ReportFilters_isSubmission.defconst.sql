ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_isSubmission] DEFAULT ((0)) FOR [isSubmission];

