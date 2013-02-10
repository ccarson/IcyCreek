ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_GridOutputEnteredByFormat] DEFAULT (N'yyyy-mm-dd') FOR [GridOutputDateFormat];

