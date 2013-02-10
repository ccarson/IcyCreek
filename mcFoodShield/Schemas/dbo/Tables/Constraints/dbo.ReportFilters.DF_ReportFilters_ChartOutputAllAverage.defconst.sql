ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_ChartOutputAllAverage] DEFAULT ((0)) FOR [ChartOutputAllAverage];

