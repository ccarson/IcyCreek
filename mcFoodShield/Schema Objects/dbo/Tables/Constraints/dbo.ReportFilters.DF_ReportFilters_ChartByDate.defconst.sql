ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_ChartByDate] DEFAULT (N'X') FOR [ChartOutputByDate];

