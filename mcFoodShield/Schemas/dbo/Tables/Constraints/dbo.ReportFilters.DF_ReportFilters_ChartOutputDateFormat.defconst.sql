ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_ChartOutputDateFormat] DEFAULT (N'yyyy-mm-dd') FOR [ChartOutputDateFormat];

