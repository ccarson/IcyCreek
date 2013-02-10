ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_GridOutput] DEFAULT (N'Q') FOR [GridOutput];

