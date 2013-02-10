ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_ChartOutput] DEFAULT (N'X') FOR [ChartOutput];

