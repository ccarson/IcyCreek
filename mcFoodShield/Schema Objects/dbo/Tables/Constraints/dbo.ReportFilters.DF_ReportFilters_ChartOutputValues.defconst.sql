ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_ChartOutputValues] DEFAULT (N'C') FOR [ChartOutputValues];

