ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_filterOnUpdatedBy] DEFAULT ((0)) FOR [filterOnUpdatedBy];

