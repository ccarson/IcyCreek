ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_GridOutputValues] DEFAULT (N'V') FOR [GridOutputValues];

