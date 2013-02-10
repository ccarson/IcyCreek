ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_filterOnUpdatedDate] DEFAULT ((0)) FOR [filterOnUpdatedDate];

