ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_reportFiltersID] DEFAULT (newsequentialid()) FOR [reportFiltersID];

